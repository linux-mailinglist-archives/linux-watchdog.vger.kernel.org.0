Return-Path: <linux-watchdog+bounces-3635-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C747FACE7C7
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Jun 2025 03:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6EFA57A777F
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Jun 2025 01:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93522E630;
	Thu,  5 Jun 2025 01:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LiXNfioy"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013031.outbound.protection.outlook.com [40.107.162.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E09570808;
	Thu,  5 Jun 2025 01:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749087145; cv=fail; b=NVLvUg1qZPahWTYOVbyNCAW91n2J0RedQ0oFPZkCtUFC/qTBymE8KklWhXmkODB3cZyl3+zZ+uMSZKMSJkAKll0oq1W00GQCSOggg/kjP0nXhu5W8Ns7OZ5w6cZS7Zm8+8lIaF8W0aEt+VpoqBTAvzcgJTnksk1KdrNSvhduULA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749087145; c=relaxed/simple;
	bh=ARpbRBUe/8cmPi3yERwtCXttR2WtqbWfWcQhCfCQT2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OD2u/JeEzlVwwpVO8RI+f08tqdGBBrhaKhaHXi5dRwoGgXNznD1czE9/GrX9NymYN1m0fm/K5B/wLbDfSMgG3lfD7V2+UuSudcMsn2WyLiqz4t0gyyapfGudutf4CBqUTFjtRFc/c801T8G29rKbM3Vmbv/rJUbOyUJzU0xfN5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LiXNfioy; arc=fail smtp.client-ip=40.107.162.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eb3riiQRUxnwDpHSEPpvA6MpklGpUuRfi0Y7fVWGeJ9lBDKH/3cMDr/WtlOZtIRmMxu6nvZ6Uq15794x3RMrq5VUJABfzrI4g4dkZRlDkDvb5wyMZocCHoVALYCpu899q/FZBf79fJJmGh+5qrPWdeddhwPQsRM4Oq8pCc7lh7OfPShllwiqAyAClztLl9rSJBwPlIO9yk/9KymxpYG/JXepqUTPmMZMJ88j1uhW6s9bT/ZHjY2HwSf+t/RDEO0Jf98GIqWa3thSJ9CN6w5qa4MaVduTcW8+srI4/l4IPK5stYhHL+NxVMRqB9Xka7OGqNRo7Hwv+44RtuizhTPfrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMrQJAUyvaYSEg/uRlu1GOlK7xb87iCzq3PYK4vq5m0=;
 b=x2ldcSAneR8ErGA3/8xzouA51ePGz6o6xRBhPKgz5RZxmZrObcUy7kAvSxghFhFn5Sr3E6llkMpz9xCzx84sILMmMdn5fFxocDX/BUFz7Lw2bKyZyTk+rmWyq3U9d0l3pQHiu+SRaF4lRmRPsJQT2A+YlZ5kqJWO/FMZ4IsXDXMNdTGzJaXleO8WeJbD32rpLgQ1PtwlnFJfA8YxvQbTYfXGHWaQiMJngDB57gEBarjoZtp7p+Q6wcZoQGw0x25kL/XiNCibzbxkURigM843VxQpEt+PODDLrD/CjY1uR6b0qpagoJwqzgbYZ5hFTPuYKDeejHVFe3hVv3xQEGbQHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMrQJAUyvaYSEg/uRlu1GOlK7xb87iCzq3PYK4vq5m0=;
 b=LiXNfioypeeVQ6dCRDL1QbDlKFRY1B/VOtzTcJZAwgOEetGDk70UaYTiICnZNgfr9PO7DSnBbHYV+0Eve6Q1CbTjMuNbl+fx9GIcf5ebvd2TBAbQ7DJWU5Ky4HKdA0aQfKz/wEUWHi6eJ54oKRlos7eZmwRt6Iyzy+FXSN1VcpPKAbSmdsxKfR9OSJ9ymCqKb+yxs6HkyDIj5iUJ6olyA2f1buRD86Gastvyx3NG+m57j5zMancXTtPZPgfQ75Va7IEDenKBwVl6P2w5BwGD4/JYfatdGgrXh00uQifgKppFvfscF+sqqF4vZYXdtmtQixkOKP7CkSv+zjj83fHS1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9259.eurprd04.prod.outlook.com (2603:10a6:10:371::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 01:32:20 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 01:32:20 +0000
Date: Thu, 5 Jun 2025 10:42:20 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Meng Li <Meng.Li@windriver.com>, linux@roeck-us.net,
	s.hauer@pengutronix.de, kernel@pengutronix.de,
	linux-watchdog@vger.kernel.org, imx@lists.linux.dev,
	shawnguo@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v3 PATCH 2/2] arch: arm64: dts: add big-endian property back
 into watchdog node
Message-ID: <20250605024220.GE29462@nxa18884-linux>
References: <20250603040230.2012772-1-Meng.Li@windriver.com>
 <20250603040230.2012772-3-Meng.Li@windriver.com>
 <aD8MxZUCkzRR0IWt@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aD8MxZUCkzRR0IWt@lizhi-Precision-Tower-5810>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB9259:EE_
X-MS-Office365-Filtering-Correlation-Id: 931a8125-79b2-47c6-a8b8-08dda3d0d018
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?oRowW5ERjIW0/iUd9IHfwE1dh123FSPoOsNFlbPw1Y/FGZH2vAnTh+cCXNXi?=
 =?us-ascii?Q?p13lczpn1Yz+KjvNZlOIDh9PBWljSeuElf1vmb3TICJgqq/iM+12ddpSULGh?=
 =?us-ascii?Q?cUiBxrR1VsqBXELSh83+0MgO95ibfAMH04T3Y/sO4Igk9g7x9mgGSgoBJISL?=
 =?us-ascii?Q?cIyiiOZsRmJlcdH3KIvHOERE0zxm5OF3GpKbVQyxFlavoqW+mgQurJcRZWTe?=
 =?us-ascii?Q?ptl9CmssiMfARdRtJmPzoA4eTDot1rYXGvl1erh/78fQDsmn6QUEXFbQd64I?=
 =?us-ascii?Q?OM6rgSEiyqelEDQnElN8HOnQt6527LjJMOhwmJ8Ok7AicorI9p8q3ho3Dhha?=
 =?us-ascii?Q?qdaWRwDPeoaWUUCu9IZMRsAk/KxWkIKnUPf0e63x4hIcM5fBgnqUnmu6H0Ep?=
 =?us-ascii?Q?asqsS1kRfgaQyl3K0Pj3O8TUk8xEx+gqRQkKq6dGzEvLLPX/UfkG2PsjZvtc?=
 =?us-ascii?Q?tpMxeSCcDYQIRwiY6GhjAX2qmhNXlMoOZUZwA/qqtYmTUWihaqKZr0Bnk1WC?=
 =?us-ascii?Q?Gg+SExdWAXWW0Zg7zFdVX5OgUyqltmo7uY65oEvdKBH382MwQ9v6w2cfDOmb?=
 =?us-ascii?Q?r+fH7bKjVai479FVm0enN8tC2MDYuEq1xluHqNBubW6diTajr9jI6HZS9wqI?=
 =?us-ascii?Q?UOvkZbObh+5dWRg+pL+IZx9NcBLsVAerK7buRBOTKmKjkejBfQ0G1bwvGJ1X?=
 =?us-ascii?Q?WqwMuPnwj/J5uOPSMhgXrgn1SbXq2Xvfj6eNFX34n6OF2mppKRknS6Z3NQ28?=
 =?us-ascii?Q?yOFYBtOImli70jWaHQH3BHUc96LCYvpvmn9yZvsL9ix2ZBzOk3oWqnudnsTm?=
 =?us-ascii?Q?MBwb0w+d7L/9+1YhiWQg5GDRVl3RZAi1aB9A1HLq93lgX5Ie6WX5vn9XsVtO?=
 =?us-ascii?Q?/ri17crG5cGYKKmZ+teUa3ZJDFFpPyJvQvsA2rREzuRjko8SZeROSZ00Pmvy?=
 =?us-ascii?Q?wX3CNhGgpBZ/lYFivcl8xLJga5fKgS4iteGILFhzPYDSuYyTs6hw8U4B5tPB?=
 =?us-ascii?Q?+79pEhD5p6oNTsDk4t1Wzd/HWoHF96MQ2R/5hDU6tBR9BQ0YWdzkqgiOA1DB?=
 =?us-ascii?Q?XClLtDlzR3LlzriVF2i3JLB8odWzIesVlJYbz1p0Qdpz+PPdcPexJi69ZCF5?=
 =?us-ascii?Q?tsoBSXzxq+7IL+RRUpXr7h1mxjelVdlRzqstRSgRrtEJewEgnvtbHAK/pL3e?=
 =?us-ascii?Q?v6xUqNwwn4bCTbmd6vOKV+GlJqrVJoCyWurSBnZptF7+uc3m5nESUWaMTdF/?=
 =?us-ascii?Q?tjWZjICc+d6ROANlLdZkBHy62XXu7AeYu8p7r8lMHOYRTOotdbMlRL6A+hyj?=
 =?us-ascii?Q?FauToBJOGhxs+2j3r69ZkVhP3ToRVY96DYu14UG61IgI0ZtNSh4J/wPpApBl?=
 =?us-ascii?Q?ZMZxOC4arXouvBZMaTQRY53lqVAHGWNyrMuP+pNcs5J8YsP0wVofywjjE0r3?=
 =?us-ascii?Q?JlduAPD9Kipmd4INw9MqQer0SdPWyDmpURvw9IwVA4ixQHakoyM8CQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?YLQ3/kSfKnBg7GERDnHDAoh8jdDDmTpiMWEC/tROu138IBMyXMTnGNEbnymI?=
 =?us-ascii?Q?hSXzmwTO1MvI1dOZtT/w+Xe/NgUyNdaI191HI5Sh5aTOzAnsKe4WGkaZyLuS?=
 =?us-ascii?Q?r+7BKZKZThVdTAl3RCbMOqIK62jfxfTx+0w3Z8VvtGsdMqsbXiLLm3mT+V9z?=
 =?us-ascii?Q?4NRX3nZtzY9vltW537GBzA4gtLckRbpwJGrAL6fKtdxOBbWa2BxCkkW0ZAy+?=
 =?us-ascii?Q?2pQS62jSoL9WR3hc/EXgEqhADlK1/+b35n8XcgvR4NLRqSdL6bO6r/v8d7C+?=
 =?us-ascii?Q?8EYZo5hvoUAgkHnCLVkr8q4EpwwBJASrekUANB2HBgBFaYioDtWCNJfoGADY?=
 =?us-ascii?Q?qTjZdgmyXJOYYK8ChSXYs1BrIf9EUO6NxVjDFRTLA6wiYuhGiEd2lRTozsuz?=
 =?us-ascii?Q?yg5HVY/7KknoWpzJXXsnaN4bJtPv+h8OFpBkU/HEhEuf/BDmTQ7XGy2iX87O?=
 =?us-ascii?Q?RmGT6ljARGoLgl//vxgWX7D1WXE7sKDd8gTqjGHTPMUDzOKpllcNIwyICInS?=
 =?us-ascii?Q?/G/7fduy2oPAuVufhSJu4OTseu3bgn81pYSKBhIIkWD4Gz13tzdvy3ez06Wv?=
 =?us-ascii?Q?f9kHuYX1XyWC52ub3wxLuLkmoUJOQQAdzSPdegHscdwih6oZzZwJcWfuuRMu?=
 =?us-ascii?Q?R4npejCNypLWycgvNAN+KPncXdhBpm74nuGJeTCEyXxtfnMxIy0wsGiDShHT?=
 =?us-ascii?Q?2QUt85X75k3gV3wgUMYFpXbOhg8V4lTj/XnVKSQS8k5XqcnwBkicFF6WXwvp?=
 =?us-ascii?Q?4lWbvuUIrzwWyrM7ZpO1gmYT+oWBJq7xMbouxgU9kyPxrCKsy/IDIxarLllN?=
 =?us-ascii?Q?/CCD+6qVI+5F+ZwUPkx5g7Qq2y+haw05cgX/viLoNYV+fT9LPahpH5Dip4pL?=
 =?us-ascii?Q?Uo62TDexFuzT01jTDdTtTjkxNxMKBhZOqK/EPk/8UPgqGv25H2KhtsK5NWwi?=
 =?us-ascii?Q?08sBMOLmiMcOA2r0bYgnQLO3WKBhf1EPYGWPUybcarywgv7Thn3CQi0bnY/0?=
 =?us-ascii?Q?OQlaVyAbeGdc7WnjjVH5QU43ocSrMLmWN5BTnRXlIySWuEUVQ2qrtz7QPKhS?=
 =?us-ascii?Q?ZgHreYApmHdmrWsaYKtCuSH7hZ7OdAneJftMcfwWTCf+GXgtm6U062RobRIa?=
 =?us-ascii?Q?R3lrV1pi3YZJdmv/7mb02vZu8hgSi28Gkum58xCOUcnzkq3C/D5h50ApjwsW?=
 =?us-ascii?Q?Vptmz16DUe5UAk2cmOOCh86MRK320oQKlNSvIa+Jsx+WLyvtBEVyywueZi5/?=
 =?us-ascii?Q?meOBRmMnpWTqFBSGG3JowOqLnU5dr0GcOQ63wgoaqkbNXzarZ7NW6gbvsfoz?=
 =?us-ascii?Q?EhMJna4Clhv3xYN+FXuVtzw4LNQ6mrpBQpB6n/K0SL1mCjbzZ/s8hzJSHY9T?=
 =?us-ascii?Q?RPyrDw4G+Gm0cde54lEpp/7FXE7CO7Kn7H8h20C1o+erwClpVs0jgoHL0CvY?=
 =?us-ascii?Q?G+KB982hM5hCwtKOFyLaRYbKQtWp/9b0IGrKVYcMCegxiwVApKDuBMyexeUX?=
 =?us-ascii?Q?RpIJypd2YyGt2tPBGpzaUVVvq7HEa+CTX0OG4OOVjpkyNliyj61r959xD/AE?=
 =?us-ascii?Q?kYO9iGZRILtxEEFf1bgh+O7FhUVOKKIJASdGm7+M?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 931a8125-79b2-47c6-a8b8-08dda3d0d018
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 01:32:20.0270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5K+DSW1kXy+I+ii5wjcKMDGwYuqWnss96JPc2Ac6PSCC/kFbeTY4Bnwce9AQ2Q+fNtnh+T/kOmmp/hyd0YaeJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9259

On Tue, Jun 03, 2025 at 10:55:01AM -0400, Frank Li wrote:
>On Tue, Jun 03, 2025 at 12:02:30PM +0800, Meng Li wrote:
>> When verifying watchdog feature on NXP ls1046ardb board,
>> it doesn't work. Because in commit 7c8ffc5555cb("arm64: dts: layerscape:
>
>Watchdog doesn't work on NXP ls1046ardb board because ...
>
>please wrap at 75 chas.
>> remove big-endian for mmc nodes"), it intented to remove the big-endian
>> from mmc node, but the big-endian of watchdog node is also removed by
>> accident. So, add watchdog big-endian property back.
>
>extra empty line here.
>
>> In addition, fsl,ls1046a-wdt allows big-endian property, so add it into
>> compatible property.
>
>In addition, add compatible string fsl,ls1046a-wdt, which allow big-endian
>property.
>
>>
>> Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian for mmc nodes")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Meng Li <Meng.Li@windriver.com>
>
>after above small fix
>
>Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>> ---
>>  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
>> index 0baf256b4400..983b2f0e8797 100644
>> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
>> @@ -687,11 +687,12 @@ lpuart5: serial@29a0000 {
>>  		};
>>
>>  		wdog0: watchdog@2ad0000 {
>> -			compatible = "fsl,imx21-wdt";
>> +			compatible = "fsl,ls1046a-wdt", "fsl,imx21-wdt";

So ls1046a is really compatible with imx21?

Regards,
Peng

>>  			reg = <0x0 0x2ad0000 0x0 0x10000>;
>>  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
>>  			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
>>  					    QORIQ_CLK_PLL_DIV(2)>;
>> +			big-endian;
>>  		};
>>
>>  		edma0: dma-controller@2c00000 {
>> --
>> 2.34.1
>>

