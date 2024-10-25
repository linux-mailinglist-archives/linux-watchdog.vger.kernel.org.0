Return-Path: <linux-watchdog+bounces-2305-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CE39AF9A5
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Oct 2024 08:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D10F81C215A9
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Oct 2024 06:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3417818C030;
	Fri, 25 Oct 2024 06:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j/MidSIy"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CC518BC2A;
	Fri, 25 Oct 2024 06:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729836803; cv=fail; b=UeFMUos5aORftsBNTk/B7Y7/XI/ZAfLRxIwHtQlQgnC81C1uz+jZ7OkIMe88L4qrPi564iRGoIVofkR8y2gbdlAfRgWunBRoo16FZsewkQ84lb9zQrcyUh5gAlTyhgl8jPPKJvC95M01JtCSZomWmXE1g4CQC5Jg6uDz5A4LRgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729836803; c=relaxed/simple;
	bh=2mbqzItu+/yIv2GBJ3kLtpyjvr1pDvnPVdgb/d80ldk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hqWFC0bsX00RGeKMtyi89tmlD0VImx6RAZVkiaD+PjBkB1CdTIZskm2ZkAk/BrwV5Dhxt+o+YEEBaUjJ6NyrchijX/Vomf0ZntjMb3SBfFgQqam21NJS2y0qDLstgu4+sJaPlaLuYT3PfmXDrKl78wuwH2GlaEh3YENEPZAT+Ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j/MidSIy; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729836798; x=1761372798;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=2mbqzItu+/yIv2GBJ3kLtpyjvr1pDvnPVdgb/d80ldk=;
  b=j/MidSIyZM7sHG24EM3iFvHbuZLufxdHqVqFXNW+yEsiUid8K1OkbftJ
   jdAsGvj4CICJm4f+hht+IWuDP5TC2XM1qRYvmQrz6d6R6rNoDCicFyDBW
   WLXk7ZpywxresAsteX+Kmg48q8lkT/QTPeM5WimAbaWg0aJV+cyuITtCH
   grXUg91pw4LsEb18a71IJBQgbV3Jd2rV+Zr/K6NGC3sl94ULxDNOZlg/k
   xefntGocBf9OsG8KfYbhaxAbO3RebX6xjOjhgX6Q7WQS8NQfrRJ3qNhec
   QISDE2KbaIICJlbSeqXHizwDkNq0XLO9S0BJgtJKhJQXQu16V7ct5qyB6
   A==;
X-CSE-ConnectionGUID: PTsOl2sGS9KAw5whHG7ggA==
X-CSE-MsgGUID: cxsXESUmSpOfPfhEg2kvzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29436265"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29436265"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 23:13:17 -0700
X-CSE-ConnectionGUID: joM/aRNjS6uN5HuLUTyH1A==
X-CSE-MsgGUID: W12QjFpvQUGZssVkWS3bNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="80924138"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Oct 2024 23:13:16 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 23:13:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 23:13:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 23:13:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPXbvqbyvIbExx/dEqp2qZ+e1ZB8JFZ/g9wxqDN8cNph98B/EGw3SfaL1BJY0tcIcR6sDS0cojHN9lBymIGUSl5O6ZdcSWLf863Hc+BC6RBi+d65eV2AAKoAmT4ke3gIbW4TZDEHjqFKK28lmEoJLS41h3fA3zMpjZwxKe/AftyB/evkkyzpn2qiLsinQsaWGjwiYS1YWLyNpkiN0QhPuJctBJVpjBdMzgEGp2QsuKJxyioP//WBQ1BE/2SwNsDGfTfy3Tu2cYHXR4Mpq3uVdDhnrGj8PHB8X6unTUaDV3WujKwUOQ8c7nFBeISJHFQcRr4vvmXfFtTBtlnZmcRBGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uC/ce8DtCd2uMO1F68rjqfuoCLxOSOGRcESGZVmlUDM=;
 b=kmW1rl6JiVNNHLXz7atRwcpSL7IryVOuj4YyUYPqRcPtklW0eJjucrXueEYhAgM8YA7kJ+ZB0IyP1YA869PpP/5ERTNnj0uai0ilqY9sKW5lw3GCerC3NIvrcihxWgVoJH/obTXtoifQ2qXjGCPJB1b8pscDES4R/FHEXy2diYcTzEOp99UuyDdAzibq2XTSfZMb4Dxt1TL5x4KSHtKL21yNciXsa2nl/UUmnNb+IHaqbsfkTX9Sn4JQiXbiH8PnsCDFiBa6AwEn9Zld+UqBw44m7Ux0ObaS+SMCVIxMUK9NGO5SXwiFZ6GSTDcop9C6QgCvn/lqbEpO0ScBhFLdbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH8PR11MB6658.namprd11.prod.outlook.com (2603:10b6:510:1c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Fri, 25 Oct
 2024 06:13:05 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 06:13:04 +0000
Date: Fri, 25 Oct 2024 14:12:55 +0800
From: kernel test robot <oliver.sang@intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
	<linux-watchdog@vger.kernel.org>, James Hilliard <james.hilliard1@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, <linux-kernel@vger.kernel.org>, <oliver.sang@intel.com>
Subject: Re: [PATCH v3] watchdog: it87_wdt: add PWRGD enable quirk for Qotom
 QCML04
Message-ID: <202410251317.64508d45-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241020232410.2576778-1-james.hilliard1@gmail.com>
X-ClientProxiedBy: SG2PR02CA0065.apcprd02.prod.outlook.com
 (2603:1096:4:54::29) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH8PR11MB6658:EE_
X-MS-Office365-Filtering-Correlation-Id: 028e5e3e-322a-4e4b-3144-08dcf4bc15e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7ZaBMwAbjh9SWAD9y9idrfRYiFLRD4+mt+2Y/q1HjHP6+t+lQz1BVFf1wYdf?=
 =?us-ascii?Q?9Y7yI+fApCtLrBL0BWKcQFPHbGqhiTkR5Kmrio68zQ67IgLd/7Qd1gXrZ7N0?=
 =?us-ascii?Q?ODEVprQmW0s5wvZ0HGzb2hk/IiF4HNs3KlxfGeghXqTvYeEmwSJMBQVTvvQx?=
 =?us-ascii?Q?KZbdCi1MeS9YJ69lFy2vOdHyd4wRdccxfs3B/S8rnvwJqL6DQie7KpMYsmmp?=
 =?us-ascii?Q?g62Pvs9HprVS34UqYCilyfxqsjfAmbP5quIKGV+icWcI8aFTKivmwcKY4vLr?=
 =?us-ascii?Q?1uIVXNh8J6hcEGgri7Lfypd/ZC50HtQyTFDQoSLu/sIiePGHkbxnc6Ho5yHq?=
 =?us-ascii?Q?HYOzRz00qfL9tKCf8cnCV9EMj2w0Uz9RfhDA6IQASGgHfJEOdXy33dD6gbxA?=
 =?us-ascii?Q?6RfuKhEdzhyBaq/SOgZUns6Y2IQ+Fe/huS2s2xIKVCK9oWTcmYhP8DhmZEyy?=
 =?us-ascii?Q?XBz0Hfo/IWrw8Mx4mFCCv/KZopV3XY5+nZW1sPsljT56yjAZ8byw7uTLhkFi?=
 =?us-ascii?Q?8xWVxggl9JK1Pt+oj39/fOGdiRw50JYlHIBt6no4eHmxdB3dvhuh/aoQoNwh?=
 =?us-ascii?Q?B9+nMd4BaiH1/dylas549YQV9MCmNzUhHKGHnyVChORX1GR22funWdLllrq8?=
 =?us-ascii?Q?AyhFfNWHnl3aoOPFIdrSbEE5tIPemyyWIteq/0cqms5YjD4JTRe5E3pjqn7b?=
 =?us-ascii?Q?QTtpCj+waQ9LstI+lgZoZGiBkixPtzcvZXUczH7/W8Q+B1OzkQ8uP/3I2N6r?=
 =?us-ascii?Q?j6z7aZ02/h+MjS2jIlKWkYpKazs3P7UvIr9zYRPqqjdExBr9+v8Ulx4BsY75?=
 =?us-ascii?Q?qYc1TruIAmEs8v6m0BeZ1kENKZsqFYbxHFia7UCjCGm1oc1DZ/zWPmA+SvQn?=
 =?us-ascii?Q?xU5JjOCE28LIPoPaNx82GF/8dC0Eem3r0hB5w2AIIXVcf9HzCKxr9n5XEQpa?=
 =?us-ascii?Q?d2npDMZYcqPat20VKV7KWzDF2dPsUMxmX3MSZpNycspaV1PafIZQ6SEeZvXY?=
 =?us-ascii?Q?yp54hglDqaYPbzPzMD1lrf1k2viXYv/670btXhcH0H/REQPi37CgCcuEoJHF?=
 =?us-ascii?Q?qZl6IhqLZ8zu3onxgqPK5zihUn7FF6MQ5XQ/QY5ZpCUDB3evaKGiXg+Mlbrh?=
 =?us-ascii?Q?IZhz040SOJ/OZpEW6pA9Q53GblZnwj2OZznqylGZhkvs8OZl93dZXwm7BNA1?=
 =?us-ascii?Q?TmmgOdf3MQBSrVMq9MawGH4gnch2cUgkjxNGvpYRvKg8yVFPtYY+eqkuIswT?=
 =?us-ascii?Q?1QK4PZPGT5qRssLhmoiGq7ZSYq+Ig57L7bs8V4ClWA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jE+s1TUe0UXQmPOaPNX3GcnbyBH7VIvtwGYknl+dGKEt4ZX6L6aVWsBll5tr?=
 =?us-ascii?Q?FZit+wfnRVt9PDn+PYv3aZ/0Rd3DHf7keIl5fPyQYLE79AfxgWAI8+xVmdyg?=
 =?us-ascii?Q?Gk6XCroJ5fjXSIuc3RkEGaDVA8fTnM6BQJyNQ6mp0aegwQRLpvv0jCuEhqVf?=
 =?us-ascii?Q?s86zEJA4vGnqRUFVC9KgbNmYQli+xpbKWJoZ/eF/mlwgU6Z3vcEaW21Htpkm?=
 =?us-ascii?Q?Yk1l+dTJDh4VxbCTDeB6/LNKfH/PcnNf7gD3DBWvkuDSIr3MA0Yg05FuPtti?=
 =?us-ascii?Q?93ShyZ3narTtDjRm99aMLGvmiFxP0Ccauj2w3aMaymdKhZS4bGDC2RSMTe3r?=
 =?us-ascii?Q?L7uYs5LTTtwtL7+mPL1oPJ4E3C7Cb8tD9eifWWqEN2B/T6x8+h6lLJ2HhE42?=
 =?us-ascii?Q?4sNCuGqB906u56szhWyyx43yQRIy89rt7l2IlflfpBuX99KaKa+ctUomMaNS?=
 =?us-ascii?Q?kqoKRKeMmAV+1lvlV7SXLQYoTHM3GPdajTidcOl5hau3ubmeivDz08HVEWM5?=
 =?us-ascii?Q?oaucfMjpz18pdTAbOz5/qLc0sXN+ZdGIZpaErGk1ci8spI/QLhAI1lKCu0Rq?=
 =?us-ascii?Q?GmWIrCOukJ0TvnKOk2zdkPNqtk/1hcQvNmvwRGnG++wNA5Iz/D6DFA0ZrOfS?=
 =?us-ascii?Q?1y3t1Q8uKKo4n6yM5CQi58P6cZvJxL+Y4RbAmFf2Ox65FszdRDfhO2WOP7Gr?=
 =?us-ascii?Q?AnAgiFmedQZ8FsEX3LBk4LrVoYO9jeB8u76fgIF1srcdj8KgZiaQhp+eGoU0?=
 =?us-ascii?Q?Xkl+lLtbfVnn7JuVOQIo9f8oseeCHiZnVcniT5Ug9JQuTgggcR0TaaVgIDs/?=
 =?us-ascii?Q?2QMEMB9FwZY5fDImC/IfL13I/4gMwkW4yenBFit9d+Zi/4wr8DjX+oPu3yvI?=
 =?us-ascii?Q?94nDXm/XIpv0FAJj/fmca4WvswlyMoAJSTDiC0r6kV3NASP6opWNeWqtjsww?=
 =?us-ascii?Q?LHazGi27OkBGXHfglnn8/rfWyQKy19+GVo3yemYOvJLl8kzWNOPzNhk0bzgd?=
 =?us-ascii?Q?LB1Z4Om6rdo0xfAYU591WwB4si2ZerNHerRyrY9q8hKeC9GbbQUclbSPSziH?=
 =?us-ascii?Q?TSbPIVrYSOz4cb3ctl5fCxB+d55CrPh8Mha/hGx6Izw+YyoF+MYKRUyVj1iR?=
 =?us-ascii?Q?aTrIgLKBe4+xq4nVeYatjlswpjn+4LdVnujltem3cL4Ini0oTgQkYuLhd5k8?=
 =?us-ascii?Q?ozBd7I5idYIbioFLg0Vd7gXzW16aB1sNOI/WwdDoU/D64PaC+nWGg2fUyrFh?=
 =?us-ascii?Q?LspP0WCpsuIL+coS0uVkPeb7AkhmIDEmgqI/5V5mO1h27VtmK8GVjjRFVd21?=
 =?us-ascii?Q?wtmTT1dCmg7aWsWwLCayPFDqQP/wV//kJfSAUV4BI8MFJDVzhbERGHqp5eKF?=
 =?us-ascii?Q?dofpMCGvuJf8pRKhrHHssTCtVg8wxsQdCXV1LknzkipRFMowJIOQXEini3Dq?=
 =?us-ascii?Q?I6qbF7wEKPtQf7nQDiBWdizZfN4ONI8OlGVk3kuLDoSYhJqtCXXPKvEspzLO?=
 =?us-ascii?Q?MkRyTL+FyoQF8B712uxgk2hY0FWFLkOqCGLjh960KPiNxwce/wb70DzXAExr?=
 =?us-ascii?Q?PqqdMzSSfYV+vVOAyAmVop/Fgsvd20N57BGHlGoeUwh89oRcly5FTRlbPM4M?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 028e5e3e-322a-4e4b-3144-08dcf4bc15e1
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 06:13:04.1356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KI1vZe0wBqa1YV4ADU6DotBWwpqyINbt6eFb/C3ro8/l99TmQNNhtwKz7Q59NtU3DxXFHCr8MSHtZOsTt9INvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6658
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:KASAN:global-out-of-bounds_in_dmi_first_match" on:

commit: 4a192c0d3e47d9be2fef576b882165a3b459861d ("[PATCH v3] watchdog: it87_wdt: add PWRGD enable quirk for Qotom QCML04")
url: https://github.com/intel-lab-lkp/linux/commits/James-Hilliard/watchdog-it87_wdt-add-PWRGD-enable-quirk-for-Qotom-QCML04/20241021-072541
base: https://git.kernel.org/cgit/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link: https://lore.kernel.org/all/20241020232410.2576778-1-james.hilliard1@gmail.com/
patch subject: [PATCH v3] watchdog: it87_wdt: add PWRGD enable quirk for Qotom QCML04

in testcase: boot

config: x86_64-randconfig-161-20241021
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------------+------------+------------+
|                                                   | 516ddbfef7 | 4a192c0d3e |
+---------------------------------------------------+------------+------------+
| BUG:KASAN:global-out-of-bounds_in_dmi_first_match | 0          | 12         |
+---------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410251317.64508d45-lkp@intel.com


[ 55.288289][ T1] BUG: KASAN: global-out-of-bounds in dmi_first_match (drivers/firmware/dmi_scan.c:935 (discriminator 1)) 
[   55.289377][    T1] Read of size 1 at addr ffffffff84934b48 by task swapper/0/1
[   55.289377][    T1]
[   55.289377][    T1] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.12.0-rc1-00023-g4a192c0d3e47 #1
[   55.289377][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   55.289377][    T1] Call Trace:
[   55.289377][    T1]  <TASK>
[ 55.289377][ T1] dump_stack_lvl (lib/dump_stack.c:123) 
[ 55.289377][ T1] print_address_description+0x52/0x2d1 
[ 55.289377][ T1] print_report (mm/kasan/report.c:489) 
[ 55.289377][ T1] ? rcu_read_unlock_sched (arch/x86/include/asm/preempt.h:103 (discriminator 9) include/linux/rcupdate.h:964 (discriminator 9)) 
[ 55.289377][ T1] ? __virt_addr_valid (arch/x86/mm/physaddr.c:65) 
[ 55.289377][ T1] ? dmi_first_match (drivers/firmware/dmi_scan.c:935 (discriminator 1)) 
[ 55.289377][ T1] kasan_report (mm/kasan/report.c:603) 
[ 55.289377][ T1] ? dmi_first_match (drivers/firmware/dmi_scan.c:935 (discriminator 1)) 
[ 55.289377][ T1] dmi_first_match (drivers/firmware/dmi_scan.c:935 (discriminator 1)) 
[ 55.289377][ T1] it87_wdt_init (drivers/watchdog/it87_wdt.c:302) 
[ 55.289377][ T1] ? it8712f_wdt_init (drivers/watchdog/it87_wdt.c:286) 
[ 55.289377][ T1] do_one_initcall (init/main.c:1270) 
[ 55.289377][ T1] ? rcu_lock_acquire (include/linux/rcupdate.h:849 include/linux/rcupdate.h:1161) 
[ 55.289377][ T1] ? parse_one (kernel/params.c:143) 
[ 55.289377][ T1] ? kasan_unpoison (mm/kasan/shadow.c:182) 
[ 55.289377][ T1] ? poison_kmalloc_redzone (mm/kasan/common.c:376) 
[ 55.289377][ T1] ? rcu_is_watching (include/linux/context_tracking.h:128 kernel/rcu/tree.c:737) 
[ 55.289377][ T1] do_initcalls (init/main.c:1330 init/main.c:1347) 
[ 55.289377][ T1] kernel_init_freeable (init/main.c:1584) 
[ 55.289377][ T1] ? rest_init (init/main.c:1461) 
[ 55.289377][ T1] kernel_init (init/main.c:1471) 
[ 55.289377][ T1] ? rest_init (init/main.c:1461) 
[ 55.289377][ T1] ret_from_fork (arch/x86/kernel/process.c:153) 
[ 55.289377][ T1] ? rest_init (init/main.c:1461) 
[ 55.289377][ T1] ret_from_fork_asm (arch/x86/entry/entry_64.S:257) 
[   55.289377][    T1]  </TASK>
[   55.289377][    T1]
[   55.289377][    T1] The buggy address belongs to the variable:
[ 55.289377][ T1] it87_quirks+0x168/0x180 
[   55.289377][    T1]
[   55.289377][    T1] The buggy address belongs to the physical page:
[   55.289377][    T1] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x4934
[   55.289377][    T1] flags: 0x4000000000002000(reserved|zone=1)
[   55.289377][    T1] raw: 4000000000002000 ffffea0000124d08 ffffea0000124d08 0000000000000000
[   55.289377][    T1] raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
[   55.289377][    T1] page dumped because: kasan: bad access detected
[   55.289377][    T1] page_owner info is not present (never set?)
[   55.289377][    T1]
[   55.289377][    T1] Memory state around the buggy address:
[   55.289377][    T1]  ffffffff84934a00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   55.289377][    T1]  ffffffff84934a80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   55.289377][    T1] >ffffffff84934b00: 00 00 00 00 00 00 00 f9 f9 f9 f9 f9 00 00 02 f9
[   55.289377][    T1]                                               ^
[   55.289377][    T1]  ffffffff84934b80: f9 f9 f9 f9 00 00 02 f9 f9 f9 f9 f9 00 00 01 f9
[   55.289377][    T1]  ffffffff84934c00: f9 f9 f9 f9 00 00 00 06 f9 f9 f9 f9 00 00 00 00
[   55.289377][    T1] ==================================================================
[   55.337178][    T1] Disabling lock debugging due to kernel taint
[   55.338122][    T1] it87_wdt: no device



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241025/202410251317.64508d45-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


