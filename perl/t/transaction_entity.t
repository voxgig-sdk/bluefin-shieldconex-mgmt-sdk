#!perl
# Transaction entity test

use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Cwd ();

use BluefinShieldconexMgmtSDK;
require(Cwd::abs_path("$FindBin::Bin/runner.pm"));

{
  my $testsdk = BluefinShieldconexMgmtSDK->test(undef, undef);
  my $ent = $testsdk->Transaction(undef);
  ok(defined $ent, 'transaction: create instance');
}

BASIC_FLOW: {
  my $setup = transaction_basic_setup(undef);
  my $_live = $setup->{live} ? 1 : 0;
  # Per-op sdk-test-control.json skip.
  for my $_op ('list', 'load') {
    my ($_should_skip, $_reason) = BluefinShieldconexMgmtTestRunner::is_control_skipped(
      'entityOp', "transaction." . $_op, $_live ? 'live' : 'unit');
    if ($_should_skip) {
      note($_reason || 'skipped via sdk-test-control.json');
      pass('transaction: basic flow skipped via sdk-test-control.json');
      last BASIC_FLOW;
    }
  }
  # The basic flow consumes synthetic IDs from the fixture. In live mode
  # without an *_ENTID env override, those IDs hit the live API and 4xx.
  if ($setup->{synthetic_only}) {
    note('live entity test uses synthetic IDs from fixture - set BLUEFINSHIELDCONEXMGMT_TEST_TRANSACTION_ENTID JSON to run live');
    pass('transaction: basic flow skipped (synthetic IDs only)');
    last BASIC_FLOW;
  }
  my $client = $setup->{client};
  my %V;

  # Bootstrap entity data from existing test data.
  $V{transaction_ref01_data_raw} = Voxgig::Struct::items(BluefinShieldconexMgmtHelpers::to_map(
    BluefinShieldconexMgmtHelpers::gpath($setup->{data}, 'existing.transaction')));
  $V{transaction_ref01_data} = undef;
  if (@{ $V{transaction_ref01_data_raw} || [] }) {
    $V{transaction_ref01_data} = BluefinShieldconexMgmtHelpers::to_map($V{transaction_ref01_data_raw}[0][1]);
  }

  # LIST
  $V{transaction_ref01_ent} = $client->Transaction(undef);
  $V{transaction_ref01_match} = {};

  $V{transaction_ref01_list_result} = $V{transaction_ref01_ent}->list($V{transaction_ref01_match}, undef);
  ok(Voxgig::Struct::islist($V{transaction_ref01_list_result}), 'transaction list: is array');

  # LOAD
  $V{transaction_ref01_match_dt0} = {
    'id' => $V{transaction_ref01_data}{id},
  };
  $V{transaction_ref01_data_dt0_loaded} = $V{transaction_ref01_ent}->load($V{transaction_ref01_match_dt0}, undef);
  $V{transaction_ref01_data_dt0_load_result} = BluefinShieldconexMgmtHelpers::to_map($V{transaction_ref01_data_dt0_loaded});
  ok(defined $V{transaction_ref01_data_dt0_load_result}, 'transaction load: data');
  is($V{transaction_ref01_data_dt0_load_result}{id}, $V{transaction_ref01_data}{id}, 'transaction load: id');

}

sub transaction_basic_setup {
  my ($extra) = @_;
  BluefinShieldconexMgmtTestRunner::load_env_local();

  my $entity_data_file = Cwd::abs_path(
    "$FindBin::Bin/../../.sdk/test/entity/transaction/TransactionTestData.json");
  my $entity_data = do {
    open my $fh, '<:raw', $entity_data_file or die "Cannot open $entity_data_file: $!";
    local $/;
    Voxgig::Struct::parse_json(<$fh>);
  };

  my $options = {};
  $options->{entity} = $entity_data->{existing};

  my $client = BluefinShieldconexMgmtSDK->test($options, $extra);

  # Generate idmap via transform.
  my $idmap = Voxgig::Struct::transform(
    ['transaction01', 'transaction02', 'transaction03'],
    {
      '`$PACK`' => ['', {
        '`$KEY`' => '`$COPY`',
        '`$VAL`' => ['`$FORMAT`', 'upper', '`$COPY`'],
      }],
    }
  );

  # Detect ENTID env override before env_override consumes it. When live
  # mode is on without a real override, the basic test runs against
  # synthetic IDs from the fixture and 4xx's. Surface this so the test can
  # skip.
  my $entid_env_raw = $ENV{'BLUEFINSHIELDCONEXMGMT_TEST_TRANSACTION_ENTID'};
  my $idmap_overridden = (defined $entid_env_raw && $entid_env_raw =~ /^\s*\{/) ? 1 : 0;

  my $env = BluefinShieldconexMgmtTestRunner::env_override({
    'BLUEFINSHIELDCONEXMGMT_TEST_TRANSACTION_ENTID' => $idmap,
    'BLUEFINSHIELDCONEXMGMT_TEST_LIVE' => 'FALSE',
    'BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN' => 'FALSE',
    'BLUEFINSHIELDCONEXMGMT_APIKEY' => 'NONE',
  });

  my $idmap_resolved = BluefinShieldconexMgmtHelpers::to_map($env->{'BLUEFINSHIELDCONEXMGMT_TEST_TRANSACTION_ENTID'});
  if (!defined $idmap_resolved) {
    $idmap_resolved = BluefinShieldconexMgmtHelpers::to_map($idmap);
  }

  if ((($env->{'BLUEFINSHIELDCONEXMGMT_TEST_LIVE'}) || '') eq 'TRUE') {
    my $merged_opts = Voxgig::Struct::merge([
      {
        'apikey' => $env->{'BLUEFINSHIELDCONEXMGMT_APIKEY'},
      },
      (Voxgig::Struct::ismap($extra) ? $extra : {}),
    ]);
    $client = BluefinShieldconexMgmtSDK->new(BluefinShieldconexMgmtHelpers::to_map($merged_opts));
  }

  my $live = ((($env->{'BLUEFINSHIELDCONEXMGMT_TEST_LIVE'}) || '') eq 'TRUE') ? 1 : 0;
  return {
    'client' => $client,
    'data' => $entity_data,
    'idmap' => $idmap_resolved,
    'env' => $env,
    'explain' => ((($env->{'BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN'}) || '') eq 'TRUE') ? 1 : 0,
    'live' => $live,
    'synthetic_only' => ($live && !$idmap_overridden) ? 1 : 0,
    'now' => BluefinShieldconexMgmtHelpers::now_ms(),
  };
}

done_testing();
