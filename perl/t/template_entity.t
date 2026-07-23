#!perl
# Template entity test

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
  my $ent = $testsdk->Template(undef);
  ok(defined $ent, 'template: create instance');
}

BASIC_FLOW: {
  my $setup = template_basic_setup(undef);
  my $_live = $setup->{live} ? 1 : 0;
  # Per-op sdk-test-control.json skip.
  for my $_op ('create', 'list', 'load', 'remove') {
    my ($_should_skip, $_reason) = BluefinShieldconexMgmtTestRunner::is_control_skipped(
      'entityOp', "template." . $_op, $_live ? 'live' : 'unit');
    if ($_should_skip) {
      note($_reason || 'skipped via sdk-test-control.json');
      pass('template: basic flow skipped via sdk-test-control.json');
      last BASIC_FLOW;
    }
  }
  # The basic flow consumes synthetic IDs from the fixture. In live mode
  # without an *_ENTID env override, those IDs hit the live API and 4xx.
  if ($setup->{synthetic_only}) {
    note('live entity test uses synthetic IDs from fixture - set BLUEFINSHIELDCONEXMGMT_TEST_TEMPLATE_ENTID JSON to run live');
    pass('template: basic flow skipped (synthetic IDs only)');
    last BASIC_FLOW;
  }
  my $client = $setup->{client};
  my %V;

  # CREATE
  $V{template_ref01_ent} = $client->Template(undef);
  $V{template_ref01_data} = BluefinShieldconexMgmtHelpers::to_map(BluefinShieldconexMgmtHelpers::gp(
    BluefinShieldconexMgmtHelpers::gpath($setup->{data}, 'new.template'), 'template_ref01'));

  $V{template_ref01_data_result} = $V{template_ref01_ent}->create($V{template_ref01_data}, undef);
  $V{template_ref01_data} = BluefinShieldconexMgmtHelpers::to_map($V{template_ref01_data_result});
  ok(defined $V{template_ref01_data}, 'template create: data');
  ok(defined $V{template_ref01_data}{id}, 'template create: id');

  # LIST
  $V{template_ref01_match} = {};

  $V{template_ref01_list_result} = $V{template_ref01_ent}->list($V{template_ref01_match}, undef);
  ok(Voxgig::Struct::islist($V{template_ref01_list_result}), 'template list: is array');

  $V{found_item} = Voxgig::Struct::select(
    BluefinShieldconexMgmtTestRunner::entity_list_to_data($V{template_ref01_list_result}),
    { 'id' => $V{template_ref01_data}{id} });
  ok(!Voxgig::Struct::isempty($V{found_item}), 'template list: item exists');

  # LOAD
  $V{template_ref01_match_dt0} = {
    'id' => $V{template_ref01_data}{id},
  };
  $V{template_ref01_data_dt0_loaded} = $V{template_ref01_ent}->load($V{template_ref01_match_dt0}, undef);
  $V{template_ref01_data_dt0_load_result} = BluefinShieldconexMgmtHelpers::to_map($V{template_ref01_data_dt0_loaded});
  ok(defined $V{template_ref01_data_dt0_load_result}, 'template load: data');
  is($V{template_ref01_data_dt0_load_result}{id}, $V{template_ref01_data}{id}, 'template load: id');

  # REMOVE
  $V{template_ref01_match_rm0} = {
    'id' => $V{template_ref01_data}{id},
  };
  $V{template_ref01_ent}->remove($V{template_ref01_match_rm0}, undef);
  pass('template remove: completed');

  # LIST
  $V{template_ref01_match_rt0} = {};

  $V{template_ref01_list_rt0_result} = $V{template_ref01_ent}->list($V{template_ref01_match_rt0}, undef);
  ok(Voxgig::Struct::islist($V{template_ref01_list_rt0_result}), 'template list: is array');

  $V{not_found_item} = Voxgig::Struct::select(
    BluefinShieldconexMgmtTestRunner::entity_list_to_data($V{template_ref01_list_rt0_result}),
    { 'id' => $V{template_ref01_data}{id} });
  ok(Voxgig::Struct::isempty($V{not_found_item}), 'template list: item not exists');

}

sub template_basic_setup {
  my ($extra) = @_;
  BluefinShieldconexMgmtTestRunner::load_env_local();

  my $entity_data_file = Cwd::abs_path(
    "$FindBin::Bin/../../.sdk/test/entity/template/TemplateTestData.json");
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
    ['template01', 'template02', 'template03'],
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
  my $entid_env_raw = $ENV{'BLUEFINSHIELDCONEXMGMT_TEST_TEMPLATE_ENTID'};
  my $idmap_overridden = (defined $entid_env_raw && $entid_env_raw =~ /^\s*\{/) ? 1 : 0;

  my $env = BluefinShieldconexMgmtTestRunner::env_override({
    'BLUEFINSHIELDCONEXMGMT_TEST_TEMPLATE_ENTID' => $idmap,
    'BLUEFINSHIELDCONEXMGMT_TEST_LIVE' => 'FALSE',
    'BLUEFINSHIELDCONEXMGMT_TEST_EXPLAIN' => 'FALSE',
    'BLUEFINSHIELDCONEXMGMT_APIKEY' => 'NONE',
  });

  my $idmap_resolved = BluefinShieldconexMgmtHelpers::to_map($env->{'BLUEFINSHIELDCONEXMGMT_TEST_TEMPLATE_ENTID'});
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
