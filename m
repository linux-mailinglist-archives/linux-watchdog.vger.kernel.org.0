Return-Path: <linux-watchdog+bounces-4914-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIlqE5B8hmkpOAQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4914-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Sat, 07 Feb 2026 00:43:12 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8941042C8
	for <lists+linux-watchdog@lfdr.de>; Sat, 07 Feb 2026 00:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 612DF301152D
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Feb 2026 23:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB7E313547;
	Fri,  6 Feb 2026 23:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Qo/H/csU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011045.outbound.protection.outlook.com [52.101.52.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F10131327D;
	Fri,  6 Feb 2026 23:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770421382; cv=fail; b=b8YVlFoV3eqUvTPrUscQ0xZ3JRQIO2C5X0GboOvZzWDKHhjqNfqlrSkFwJr+Os6vhkNSNNblUnyJEj1VLbNIMTF0+ADz9UCGESdlLv7iNI+npO9grKCEEysS2Pb0uRwG32oM7M65kwqckuInZXcWAFJzDcaAnqET79R92zYTJU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770421382; c=relaxed/simple;
	bh=ocRbUkMtLKifRHmzHy9GwTzveRCV3Q6/yevYdmTPDVY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DyuUUQwJBb1C4BB6VbC3RQXzbHVpP2sbILpOKDpHBWGKq/9ZX8Bj3jcF77Q8zD0JGsHsif5yUgDia+GVvQJQN8o4FhDDJWZpwVAri1sJRTm+g61lBxxRfE2vjKdz2vyESrql3BBKKlNcA7QvAwr35JRYTV23s9QJnMYzH00AtMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Qo/H/csU; arc=fail smtp.client-ip=52.101.52.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUqD4la/XhA/LavJH02EDZpNDri+3OJt04yZbT2uqtgUB6yukt5plrhzkj+OfKvZUz0fvR4Oe4UUEhFyWhHbArmW3LxsHYmJE/wlFK0eF5IxmpVlbWKoGC22cowG9foooc0zHKOmPLRycK0J3l7I3yL86iYPjzBZDyOi138oI2n38fxqUbWHs1UJMkHRtXRGg0UZtqvQ8MoLNtasI3v2S3zbu/Fa7OaFK85UWGnzvYnJwkiAuE0gYNApS7ratPCkxCE6S4lJp0DGd7RBUzIpcQ1xR/nzM3F4QDN+4WxJ/w4sjf1VU99aNERLDlDH1sl/CegdJQRY1HgegPpQ4vxQdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wb5agCuO7venKzrNEL8ByYUNOe/83hy/agLv1EIoKkA=;
 b=IUgxpEZr4ZixslGyYHi2YriiMw6aTXNvUsTJKtw5tZcd26RY5zDK7YmCJOmYLEZxD+/cw02k62V6Z+mfYSRJZ8HOjb2VVP4fgZSMRTO9RHXzLcrAGhC97DPpGhz0VTLniZAK1OI/Ii5NhOvhXrjEwV5Oyb1r/vIq8PdI/VBDfbxJdHzDMQirINBvVQuCFKAIfETTe1eYrj1RYnGoS9+IGAZuFLqhe/wHGu0EBJUfg2dE38eL+0NOdx9XWv6JNBnulFa5zCkT/T4wkeTHf7MKjTJ59DWxoktwe6j0UbN1wdTRJejF2c9142C2XF1neSwZNuYlTVhdd7Paad39Cv3DbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wb5agCuO7venKzrNEL8ByYUNOe/83hy/agLv1EIoKkA=;
 b=Qo/H/csUkENTNgjf+30ZVP1AMiQV5sHv3tDHeRtMKNgmInxtLUXaaExxW4QQ40DAYV5bksnqqeVo5173Ig+3OX3IqDja7YJljx+8jiZoK83OckuSpzWBYfEySIYPO3n/4B+hcb6X+pQqBy7dlAu+J3McXxy0UB0jXJnQgoT0gcE=
Received: from MN2PR08CA0006.namprd08.prod.outlook.com (2603:10b6:208:239::11)
 by MW5PR10MB5806.namprd10.prod.outlook.com (2603:10b6:303:193::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 23:43:00 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::96) by MN2PR08CA0006.outlook.office365.com
 (2603:10b6:208:239::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Fri,
 6 Feb 2026 23:43:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 23:42:58 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 17:42:56 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 17:42:55 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Feb 2026 17:42:55 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 616NgtrR2138237;
	Fri, 6 Feb 2026 17:42:55 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>
Subject: [PATCH v5 0/2] Add reaction control in rti
Date: Fri, 6 Feb 2026 17:42:53 -0600
Message-ID: <20260206234255.380530-1-jm@ti.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|MW5PR10MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: 57f34057-3423-4869-7764-08de65d97546
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I8RB3hOYteY4AsUqT+dRBiQNIpjf0Payno3tNHZS316nDhHEkDex5xeishpB?=
 =?us-ascii?Q?eEFuILJX3l5oBDtn69f+WwxRa+mKqHj9q6J0utJCAOWenLvai5aFtyXRNsuL?=
 =?us-ascii?Q?YDs1R6FeYULpec/5v8BSX4tlVzgJHYBIMvEnRpsquPnz3y8Qxq3AJuCp2gK3?=
 =?us-ascii?Q?Dpd/6nnUkuXBtibL3RES6jNn3tfeXLzCkZ76OWxJSUarZI95aNy+i2m2WHjt?=
 =?us-ascii?Q?XSfGPdjGvJPZrC3Qpi6/bjYzxyWuLKHhD3T/HU2bOfp4hLU/K/WcCres2hg+?=
 =?us-ascii?Q?322gj53v0XlDGEVfR/SR2kAb3/1o6Rd6orqcg9O/xhqKTvM0UgwzTXIX04ic?=
 =?us-ascii?Q?iZ+PD/g0rPiPKs9AM8cPeurJUMim9TAjUjJbwgf0399le//wIj0d1hnkXT3j?=
 =?us-ascii?Q?DYPRLeheuhsJ/GagHyk2UGhbGoxz2T/kxkYtRPXEfj5AOOxsULFbnbG/Gh+E?=
 =?us-ascii?Q?ryvuUmOpwXl7ese0Y5gOUpHhn5Nz9+l+I1GBQyWYnAhave+8JbnmKPRa78xk?=
 =?us-ascii?Q?bVd2bPl0Y46QvQN+AANniWyT6FmJzwtnsoJ38u8e3sEUNl7HpiHThYmtchGm?=
 =?us-ascii?Q?9RHbTkVm8y2kOVdTd9qJTvyLD/5D8k4NaR34IfaNEhfGkjg8Gab2v+WFcK0H?=
 =?us-ascii?Q?oyjOdgUOO4ymAqJINkxRs9ktl7MoMfTdRZO2goejzAirSvWRbUIOGs3xGjEs?=
 =?us-ascii?Q?3w2YewGw2eolPEYTpAWImgQ701ugcyUqpqyGzhmOn2wSbssJXri1vgJKeu2P?=
 =?us-ascii?Q?0WwkwNiTocobKOWEpOfckhQf26yuJBEid7PpEhJD1haUbKpYsUdYtpaCA1h9?=
 =?us-ascii?Q?EJw8HgJ80uNm22eUPqMTvq2LZvIPGqGJpsi/v/J6PCWuLmli4MlMheIaDkPr?=
 =?us-ascii?Q?RG/IMmab9t5QonrCjB4/+VslIza6lutvXCVu3jpJqkVowZjSJHwYoZ/Y0jtm?=
 =?us-ascii?Q?QBb+1+ITDOxgVZctca4i+gpZYDW0z+wiU81R9OzsYkO/DJEpCW2pBCAYMPyu?=
 =?us-ascii?Q?ExgyUhnPATFA+ZphpOw1/XHRSC0hqLHNn1M+fi5DjsIIhhWlGhi2p02Afu1N?=
 =?us-ascii?Q?UMT0m5+ukEkAAapHUQIuPKOrR6qHeVSpx28En3yGKaGu1ua4K3t0GMRdrmtF?=
 =?us-ascii?Q?wrLtE6AvdK7MvBz14uP0bzPVLrHwmCU15y+WQGucO9Wl9Z2e1eCnXA3T2rOl?=
 =?us-ascii?Q?CluIHdI/PnjbwHCzG61Forjudsv6JL8AXfRr9IUHFPqhO+0zOQH9nwOlo9my?=
 =?us-ascii?Q?kQCVgMMJhZl6IvdVu7Fwq5ZyduasFACNh0e64V565785Jy7Xx+95FrKq1lGF?=
 =?us-ascii?Q?ieY4Ui6yzIeQFdwupVFR+qN0WVQvtVyTKAbJ9i0Bt4A6nJxOZXODPlnXtERL?=
 =?us-ascii?Q?U17/R2xwMIY9kKbTllSARv40dGoTN2gprswVbYVLFMPOE5p/Vd+KUysbT2bH?=
 =?us-ascii?Q?sRqiVseKJFy+5+LsZP16rJ8LNcyhCz9gJejVn3AJnrpOvHTreDQW9hGM4HNi?=
 =?us-ascii?Q?JUCbvM5k5Y8587r1ET+JHqWjl2icA4vV/GoSRXldc43+eQ3soMq+SYA7HwcV?=
 =?us-ascii?Q?l3TtFi8cQeYVo9q8Q0KaMQQX185V4Csz5xEt1d0x2ZXguNc//2orqmqorV4v?=
 =?us-ascii?Q?OUUx09y9Lob1TXbgzj5VUJOF2qcOwk4i21npz7e1wAAWJCfEmB3UncKK5Bgo?=
 =?us-ascii?Q?fwFHvQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2Cpx0YEHnl+d+9/4sXMUE+1gsjsIm7vLqqAP0DE11WvQrmeTmQrdR/LFmB0n+Iq7pOU6Y/4nH4pGvHwUfQdaH1diHpXIGqm9iqpU0svxChyAay+A7WDAiuOVW2trXa/lhwJ1UimkHIpIW67XWVt5uM2nUdd4UwiDLhZVMY3Ot1peFjos0ueDJN//HX4tZ7OqCo5K8qm/nrHAwmKbadopc8h+lnxzf2mXN4/W07O+kRd/L7QoqnVmwXTtIITjPy2b6kRDqia78JiY3fxDFWuFwIYS0Uwf1ih3YuW2Qy+4Y5TXlWrmWWnr0+UvJaSwgJxs85NqOdid3cloDr5DI4gUF2TpiX/HpvBr0JiuUbzzNFfrxLn4MGlCA9lIyqy5aOufbmIAqrQ0J5Tu3TchtpRfzIed6NPtot002KKNS5YCIgSGrQ0ZHDpSTNP2ekweHkJx
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 23:42:58.1844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f34057-3423-4869-7764-08de65d97546
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5806
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4914-lists,linux-watchdog=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jm@ti.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AC8941042C8
X-Rspamd-Action: no action

This adds reaction control to the RTI watchdog driver. Since AM62L SoC [0]
does not have WWD reset output routed to an ESM module like all other
K3 SoCs and has the reset output signal routed to the reset HW block,
add a new compatible for AM62L [1] and configure reset reaction for
AM62L SoC instead of NMI.

Changes since v4 RESEND:
- Fix commit message grammar and capitalization issues
- Store only needed bool nmi field instead of pointer to match data structure
- Add NULL check for device_get_match_data() with proper error handling
- Rename data structures with SoC-specific rti_wdt prefix and add const
- Update struct documentation and clarify WDT expiration comment

v4 (RESEND): https://lore.kernel.org/all/20260203181931.1496723-1-jm@ti.com/
v3: https://lore.kernel.org/all/20250707180002.3918865-1-jm@ti.com/
v2: https://lore.kernel.org/all/20250625143338.2381726-1-jm@ti.com/
v1 (RESEND): https://lore.kernel.org/all/20250624202605.1333645-1-jm@ti.com/

[0] https://www.ti.com/product/AM62L
[1] https://www.ti.com/tool/TMDS62LEVM

Judith Mendez (2):
  dt-bindings: watchdog: ti,rti-wdt: Add ti,am62l-rti-wdt compatible
  watchdog: rti_wdt: Add reaction control

 .../bindings/watchdog/ti,rti-wdt.yaml         |  1 +
 drivers/watchdog/rti_wdt.c                    | 39 +++++++++++++++++--
 2 files changed, 36 insertions(+), 4 deletions(-)

-- 
2.52.0


