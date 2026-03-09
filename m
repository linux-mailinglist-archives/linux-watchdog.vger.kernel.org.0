Return-Path: <linux-watchdog+bounces-5074-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BveKWKvrmkSHwIAu9opvQ
	(envelope-from <linux-watchdog+bounces-5074-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 09 Mar 2026 12:30:42 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA31237F33
	for <lists+linux-watchdog@lfdr.de>; Mon, 09 Mar 2026 12:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C865301327B
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Mar 2026 11:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2000239B488;
	Mon,  9 Mar 2026 11:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="nwwr0Lfv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11021106.outbound.protection.outlook.com [40.107.167.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B46393DF0;
	Mon,  9 Mar 2026 11:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.167.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773055606; cv=fail; b=A1yIbGqb2BjtWBcjWXgbvhc9oi6v5XkwsENMCXB4ZercpCIgC0tT5Yb57GDkDkEDs0kybCeSwevFcBzmGlUV5yrvusXltTrBFGAqK950e1Qpytts5jsagH8U3tJQj3g8kZupRA/7PeZZ4Dx+tqiJqjNLwBhroKVUVYubR70EAOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773055606; c=relaxed/simple;
	bh=oVTcYRoHxBlH3bfbuNYwn+5Qx5Jts3BbavngQ383GyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pjCYEoVPHlxMbUONrTA9tclsnJ1bR1RCvNBThTmVTg0Sbfg+4p23fUH17FywQv/zp6Kkym/8aktFjT+yjU0BTkZ4hA+ZyuaWovqESgWiT21uxIGSqTUDUJIY+mLaqeRmEFX2YKRST22LAU/ronpVexZpy/IIU1GeNpF7meW0Nes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=nwwr0Lfv; arc=fail smtp.client-ip=40.107.167.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4elC6izbt/N/dk0tdmhyleQ0/ev+9NcpuVQ1Cw/6+2BodcLCTt87dkzuyhTE5KY+t+kGWXqOCrg28hoJtAPFAPWXRu4VqHlWK/BzeIAXgRdSZ+/LdW8tvLuM1h/cQd5tsYAj37xMWx8SG7WMNiMclGJeflxFNDTwRZ+DPzOWOh2pbpwzwDZNN4b7fB+88yfUSs2MxRlmVuGJ0GwZbEfETfXn5OhB/wRy1RoIGVCvFmka0vbWoDudnWFMAGJMWwEjNP++apvGMWvTQIilY1rEPxPFplSbmXgfD0uQUrUI6RO9+WfE/GPDkKQPmMT/ChhfQb/Gn7G3sJIkzA3l0r0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4l9bsRrg9dr2K/FZbYxL7n7MwdE6BwmdYh79AvELWg4=;
 b=M0C3OVF96U6hIeG+uNXc2Afa0uV0BffesBugJYypvEEGeqiBo9o4BnAvtbmx8LQ6lNMdw428TnLlrO6KB1H0R5qjqS7l2p20IkRfLzELe4sAQp9kjvj7n4fiskiJIjagKmG5rSQBKThP3aoB9j8HDku3c0spJagsA9XcLNGK0WlmfkEw/o3F0YHfNN0dG/jPnsHJzDsjYIJc9lnq7T7HP2wc0IWM+EA9mLwc2PEbY5ifsWzpDpTTHw/9dUvIl7RzEteEL7BD6s+ZzEzAAn75dWgfRxYN6XaT+p0E9t/z/YTZyKmMLob4VfuVZkcqQZ7WQD5T3/3g43r0DwNnvXXTzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.48) smtp.rcpttodomain=intel.com smtp.mailfrom=duagon.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=duagon.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4l9bsRrg9dr2K/FZbYxL7n7MwdE6BwmdYh79AvELWg4=;
 b=nwwr0LfvQTruVF39MmhpEMQunSagqIzJTgxYKqr1eL7a+5Y/WLNEiv1SuwJu4dmGBYmJY4VF4jOcTtdkYNOi2ORwPytreJzw6CCdT1mOJpkH0jZ5Le7Z/IvvuYNVh8UVXvj6vJbxakKPbMnsqx65fC4ocgRHKG3hkKhnxIH4Wh8=
Received: from AS4P189CA0021.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::12)
 by ZRAP278MB0029.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:13::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 11:26:40 +0000
Received: from AM2PEPF0001C712.eurprd05.prod.outlook.com
 (2603:10a6:20b:5db:cafe::17) by AS4P189CA0021.outlook.office365.com
 (2603:10a6:20b:5db::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 11:26:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.48)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.48 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.48; helo=ZR1P278CU001.outbound.protection.outlook.com;
 pr=C
Received: from hz-deliver01.de.seppmail.cloud (162.55.72.219) by
 AM2PEPF0001C712.mail.protection.outlook.com (10.167.16.182) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Mon, 9 Mar 2026 11:26:39 +0000
Received: from hz-glue03.de.seppmail.cloud (unknown [10.11.0.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver01.de.seppmail.cloud (Postfix) with ESMTPS id 4fTvq33nQqz4ws2;
	Mon,  9 Mar 2026 12:26:39 +0100 (CET)
Received: from hz-glue03.de.seppmail.cloud (unknown [172.18.0.4])
	by hz-glue03.de.seppmail.cloud (Postfix) with SMTP id 4fTvq33W5Qz241v;
	Mon,  9 Mar 2026 12:26:39 +0100 (CET)
X-SEPP-Suspect: 704c865ddef5497c8a905d6e248f0fde
Received: from hz-scan05.de.seppmail.cloud (unknown [10.11.0.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue01.de.seppmail.cloud (Postfix) with ESMTPS id 4fTvq32rrPz20bd;
	Mon,  9 Mar 2026 12:26:39 +0100 (CET)
Received: from hz-scan05 (localhost [127.0.0.1])
	by hz-scan05.de.seppmail.cloud (Postfix) with SMTP id 4fTvq32170z8mxC;
	Mon, 09 Mar 2026 12:26:39 +0100 (CET)
Received: from hz-m365gate01.de.seppmail.cloud (unknown [10.11.0.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan05.de.seppmail.cloud (Postfix) with ESMTPS;
	Mon, 09 Mar 2026 12:26:35 +0100 (CET)
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17012048.outbound.protection.outlook.com [40.93.85.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate01.de.seppmail.cloud (Postfix) with ESMTPS id 4fTvpx6SVDz2wqd;
	Mon,  9 Mar 2026 12:26:33 +0100 (CET)
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 GV0P278MB0829.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:50::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.25; Mon, 9 Mar 2026 11:26:32 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::30b2:3be9:48ab:c354%6]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 11:26:32 +0000
Date: Mon, 9 Mar 2026 12:26:26 +0100
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: jth@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net
Cc: andriy.shevchenko@intel.com, dev-jorge.sanjuangarcia@duagon.com,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/1] watchdog: Remove MODULE_ALIAS from menz69_wdt
Message-ID: <aa6uYsYCZ1amqXIn@MNI-190>
References: <20260108133332.24560-1-dev-josejavier.rodriguez@duagon.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108133332.24560-1-dev-josejavier.rodriguez@duagon.com>
X-ClientProxiedBy: MA3P292CA0051.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::19) To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|GV0P278MB0829:EE_|AM2PEPF0001C712:EE_|ZRAP278MB0029:EE_
X-MS-Office365-Filtering-Correlation-Id: a332ddb6-7a1a-4fa6-55c1-08de7dcebbb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 NWAhmliGePCvZ8Nw0fWeGSzG1O3MbwvDGHwJUajnTrssGR2pCQhCSYEgCV3hyXCDTf/7VA4vEQ729qNZswcur73e1ViSc+A3iB6pjJ/L4CnmstSY9vgN5tKvPi9KW/0ZSfwxcaFyZsVAue6Qx/k0GbpvctukmDU2yar7aI8tMbjteLjKYnlG/6AC6Ubf/D0t9CiR8KWb57YmqgPbosAQikBfvxRsevCmI/+wNTo7hlGSf7hGb95NchoeIdVv4ebs1ydg8SXPeAIOVSrO6oOM+bPLaTtMO8LO4RiznW8Sy7RJDOeRKk1B1avpCcdg38sschLS4TERuh4bBQ8x5zowxyg86ABNi/DhF6fb8A9JGohLICDrHw/pp5z3DS980stYvE5bIkJG1kW7EYUmTx53yvh+lOeB9fUrP7ivIx7orMPy1hijNw5zuRI72NRpOcIBKnXmVf1KHW4beN36PeCoxsgZaxs7g5+EYuB0MvQdX+kzCiYjwawkcuiWwwDiFG/JhDAZXcvNVFjK3qlL5PRaPkr+j+8nEsiIODWmlfNOCDXvo+bdrNwmtqNqUAxu2MwO5p2/vvKQHm2Fwl5LQAnRJEgTeXvqnLcwgGSXg+1MTUE6mbCRXrzjkac3eHGVqvpWX0nTC7eOwi9aWrqjETxYHqM7JNLBmn9iw4VRlwrraEmJNoymZ+hmC+/Gjxv2zvZQfHAV9KPz0pOd8agQg6pQq3PwOzgEFmH0z0QFublZ9M3+33nOpGTJsHn5jenCC2T43RMiVbpX1fkznObyVI05fSkjWtDIhpuZJc2XyGuYQM4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 B5ClCJn+QQSqFMe0wrNDHbkVuvlHUG6ZYvGZlfITJCOMmQvYSbuhbfW+pJ9r4wGgRy/F/EQuD3Ayek76xLYQ9yNQ40KohSGYfRaiPrsxKaF8M8N7GhVFZyWKNEEy4sh2UiHtz3MiaB14PXN2eZl68xQsaZaVJ9LPU3Dk758OM5giS+UOJXxzs/ZYdsImY9uIsGc9Ba2eydYE0fJekhrlfoyjbINAKD2KvPxZYs66/7ih5/t3BVBr2Yg9ibKlpz0R9+2QeqOrse3haRPdhBI4t/it6fmyoj4fO6q//ncyUVg3ccckpMjoGcyiA7pcquPWNSxzMEY2c02pK4l2HQztJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0829
X-SEPP-CCCVersion: 2025-12-11T08:12:51+01:00 9ed91da2
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.48];domain=ZR1P278CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.48];domain=ZR1P278CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1bd020a3-ac47-4b3d-a2d2-08de7dceb6fc
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|14060799003|35042699022|156008|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WVDFS52DFBgFrID6OYvcGRMmQvbl5W8XHboOHLC+849+ptG/G9XZvIsfFQW+?=
 =?us-ascii?Q?dvCvwyMMHp2trkPlKC0TXg4ULDwOwk3+toq/WB/gKSquj3iVch9pgoSMJic5?=
 =?us-ascii?Q?GtRZ9wld+7MrtXuXc5fvY8GeGwVZtvM6HjkRGzCHJcnPEobhI70iTH4enuAR?=
 =?us-ascii?Q?VORcwEwgip9gRghY8lqao3z3urUa3DX7xtXI89kEuqvQ8ZJW4TJZJ/SOocPo?=
 =?us-ascii?Q?xoWh2bAKo2QlVI2JtF0Pdb+RW4t4c+nZ5V4iMjUfn1CY+mlAA4Z9Ylci9Unw?=
 =?us-ascii?Q?g0UNDQ0vbm2O3b4qvEJr47+y/MWF5m6ZspexhRwzrZLSSAJ5+ohcMnoc4AC9?=
 =?us-ascii?Q?/OvMyGbiO2YTz4OljqhEG1cVqU6jrKCdINebr4USeDJvaJ0Eb+22CAoLik+K?=
 =?us-ascii?Q?tBoJEB6J+Gka5x8MZEGONwFZVSQY06s1EGnifZ3qBvkugQ3tw/bjK2beYDI7?=
 =?us-ascii?Q?s3GPkJy6tOEOANHHzjRsBxT7ctGr3++ocK53lWSfa3eEcnlroi2m2IzRDefl?=
 =?us-ascii?Q?0KX//CuWbOHAQUCEaxs8IRb+8N33xHNx17uCc6vtbo3ySenLylMp9/3sKLB8?=
 =?us-ascii?Q?CXAhgk2HoJ/1NIMMtZjeDyTEKyFnp9i8O7T7bQxRwfaVnSTkKlIYVLxl1nq+?=
 =?us-ascii?Q?rDnI8HFm6LAmtzZU0Dhvl4I+bNsPP5FqC/V6KcbfTeOSVkxxvlZU8FwIrqEW?=
 =?us-ascii?Q?jdAwyza2Dgc35058oaul2t3yKOcTZztpUwXuaKh0yJw/A50cQro2HTUJz+Dt?=
 =?us-ascii?Q?34U+/C1P6otvVcF7DWXEn2SMC8dEc5c0abW04jCLC7h1jvFtgfAl10TXIvv4?=
 =?us-ascii?Q?0NILRdKC1EO6PfGXiqk2GfeJWcVjLIYv+tw+zAMcIz2WV3dPsVCfsB2NtXnz?=
 =?us-ascii?Q?L+Vj5XXLQZOAecfLZWRRri1OngdZUE2/1Ni1IcdewHyOYxYEyaMseKRa0UaB?=
 =?us-ascii?Q?pQ0z0rZwZXxhf7e5hE76rYQgZ8yzBuE4AZui6MBfxfnk1yD1CgWDPSMBnzHE?=
 =?us-ascii?Q?y0OUHZpwjIrH2U+qoJDqJl2djOj+2UxutGitwZB7wKsc8wOE5GXJntKek+sQ?=
 =?us-ascii?Q?aTLTRggKiKMeRahHHY0iIL/kpcyY9w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:162.55.72.219;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR1P278CU001.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17012048.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(14060799003)(35042699022)(156008)(376014)(82310400026);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xprVsRkaIq3DgoNmJTfIxkdh/4uXVn61pv2FgnDTCbjpBI3szbJQCdsLRpEyaSDVX3472kBC2rvdqPijhA6wylO9PXIitYeYOc0Zm1lWR+9P40tCXXNf1BOUXD1qMZy4T8MPs/mNvBbgwo2rdq9VHfVjPv7+eHVDKhT6tgtSDRAtVTPhKDcjBkef2dHiYJAyCsE/6aPf7Ufon8FxRI7/o+moby67h7j0wMZ8ocsNpHW/NepemriUTW5n4y6wfyRaJHDXMwQ9tOO070v2Ks0r9D6Na9OcFyR4up/aWLkOymTW1S80t0gBbhm/RjHVGXKNJTsanFEDiw/gu1mWRfir9IoBx1BbU0kqPpsPrHwCw3DamyShUApt07AtSHzeoSJMm9CHWY+enT97cAUcaz8tvH6glxGlUsCaNXmrgY8WWao0TFtYQojAeeNeGiBeGbQ3
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 11:26:39.8093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a332ddb6-7a1a-4fa6-55c1-08de7dcebbb2
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[162.55.72.219];Helo=[hz-deliver01.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0029
X-Rspamd-Queue-Id: 2BA31237F33
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[duagon.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[duagon.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5074-lists,linux-watchdog=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[duagon.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dev-josejavier.rodriguez@duagon.com,linux-watchdog@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.960];
	TAGGED_RCPT(0.00)[linux-watchdog];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Jan 08, 2026 at 02:33:31PM +0100, Jose Javier Rodriguez Barbarin wrote:
> The first patches I sent for fixing the autoload problem encountered
> on mcb device drivers were 2. The first [1] was focused on updating the
> modpost process for letting kbuild to access to the data within
> MODULE_DEVICE_TABLE and the second one [2] for removing the MODULE_ALIAS
> on all mcb client drivers.
> 
> They were rejected and Andy suggested me to split the second patch
> in a per-driver basis instead of sending all drivers' changes in a
> single patch once the first patch was merged.
> 
> The first patch is already merged on Linus's Git repository for 6.19-rc4
> 
> commit 1f4ea4838b13 ("mcb: Add missing modpost build support")
> 
> So now I am sending this patch for removing MODULE_ALIASon all mcb client
> drivers as it is no longer required. This cleanup is being sent to each
> affected subsystem separately, as per the review suggestion to ease
> the handling for maintainers.
> 
> [1] https://lore.kernel.org/all/20251127155452.42660-2-dev-josejavier.rodriguez@duagon.com/
> [2] https://lore.kernel.org/all/20251127155452.42660-3-dev-josejavier.rodriguez@duagon.com/
> 
> changes in v2:
> - Renane commit message
> 
> Jose Javier Rodriguez Barbarin (1):
>   watchdog: menz069_wdt: drop unneeded MODULE_ALIAS
> 
>  drivers/watchdog/menz69_wdt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> -- 
> 2.52.0

Dear all,

I sent this patch series a few months ago. I thought It was already applied
but after synchronizing my local I came across that this patch is missing.

Could you give me some feedback?

Thank you so much.

Javier R.

