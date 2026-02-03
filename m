Return-Path: <linux-watchdog+bounces-4892-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNrxKUY/gmmVQgMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4892-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 19:32:38 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8DADDA27
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 19:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E06831CAA6D
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Feb 2026 18:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386293A4F23;
	Tue,  3 Feb 2026 18:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GMtwQAJE"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011059.outbound.protection.outlook.com [40.107.208.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699A736D517;
	Tue,  3 Feb 2026 18:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770142782; cv=fail; b=qdLjm+Ptb/zQTxa2zntVwXTa/Bq1mRvh1haBhyRcr4DLkoJcNekiN6Zm6i1FeGDzSF83ImN65nC670taH6z92tOdxygG1S94v8Y37/goK8d345X9xvPp/Lj+QI617Kz0qCN03nNSo9UJUK7+z/IX1JaZE85WBDgYYmlIglUezec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770142782; c=relaxed/simple;
	bh=lSGQLu6uWH1QfO+xuv9OhJUeecV3Y2SpLo2ED7swgvQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FDYmucOHG7VQponcFqMHYkaT/k6i0cdhj/Cd2kj3mnhrGR+KXC9uYnOCqqZuLswptQzN7TIT+2QgOJMeoUMPrt83Uw1W1aQYUn3StRHW2l+TfFpCaJ3JxNLFOrc5iHVdbpMCXhkZQbT4WiGRWacRu8Re0kNcM7VIevAjIw++Phs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GMtwQAJE; arc=fail smtp.client-ip=40.107.208.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4b4wUZGmd9+gEySYPhHySA7OPTFNV4UZjy6/P+X/0gOYFqYqtXbt1qwB1FHIMLQofLds8M58dixoz1frSeJwhkIPxrP+A39WJkKtMAFdrQdnxWwmSrm7PnnTbUj+vPIuJWPKmgpDeW0JSuMHrcFKZ9DiF6IGG4j1TCCvCndN0BO8rGuzOwSxf5iPsqub1Tu9BhnpuWijWi1QP7mBd4IHrEvENZKSSha1ul4aWKSsF4x77HOxoMS2OsV4CPvkoU4OGTnI3bKqYMIBjOgJhQB3mSQAeYEp5GhUhDJFaprwNQDBn8QQwxG2/vJ+K/nqlzFp9zGgN97gfr/uM5DlOw2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tK2B66973uuKyNpHek2hkUH2J+6BMlFEUuCBXL3FFu0=;
 b=rq6v+5QsXHop41YEUIvGmf+/VlzcbJMfpNlX7R7qgreoWLx51KJ3UO22Yta0NquHd1ElUXtlilYjwRFbwQKoKxUGXjUl82n05SeVuViSh2cOTOkVdYYeck/P9kWtYe8RnR9vscQ2Ec6UdgQCNOiobfGsPe5eaCPa6QW+mP5XIg0ciXxUluSNX0LW6u/OJrBRw1cwcFQ9D6MS2wXc1EPA+I9R6R9hMFj2FsU3oEpie2rjDOXc5sP5LVExiMNxi3NYW+Pdd33DdTjP9tqZs6PeyVVd2/3KcvQRAYj0YgMmkh+AK3QLYqc0eyaIajtgkwAO1rGZlRFXKW+1n1vSilIH9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tK2B66973uuKyNpHek2hkUH2J+6BMlFEUuCBXL3FFu0=;
 b=GMtwQAJE25wAgTgX1EvIIlQdyWxSvSlPfmcvp7Zr2DKRd2JZUoPUKOF7N7T2SPHMdGhW9cXQeN0C98IwREUf1EMc6JGUbF4LtEEsfQhcy6uW0FQRsLaxLCXueVd0y9fOOVau4f7FTjkX3/vnFLy/1ZhpwEuUSnSHVg41AnZSbZY=
Received: from MN2PR11CA0013.namprd11.prod.outlook.com (2603:10b6:208:23b::18)
 by CO1PR10MB4466.namprd10.prod.outlook.com (2603:10b6:303:9b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 18:19:37 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:208:23b:cafe::37) by MN2PR11CA0013.outlook.office365.com
 (2603:10b6:208:23b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 18:19:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Tue, 3 Feb 2026 18:19:36 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 12:19:32 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 12:19:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Feb 2026 12:19:32 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 613IJVHt181632;
	Tue, 3 Feb 2026 12:19:31 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND v4 0/2] Add reaction control in rti
Date: Tue, 3 Feb 2026 12:19:29 -0600
Message-ID: <20260203181931.1496723-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|CO1PR10MB4466:EE_
X-MS-Office365-Filtering-Correlation-Id: ced3f3ef-7937-46dd-db56-08de6350c982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MNz7CJRkIFXXtzjMdgPEkUa2q1Vi+ZGAzck4K8eRtzyRcx+y1xR0ZYda6rpt?=
 =?us-ascii?Q?uIZQ/f8AKNrHuhnmAfUxN3YalaPZF+hfGo9rWdLTp9WV1otQorSnpNdKm8Q3?=
 =?us-ascii?Q?gnie/enpODmBEWkQhaYdU+bM2oJ+pAO4zi1p/1kDPU0vmFS6OvwpMgxKOf6r?=
 =?us-ascii?Q?tqvjRZc/lLpueaQswH1HfuLDb/DsO6lLXX2fBOmMYud3WZ/ULjjSov46CkUV?=
 =?us-ascii?Q?HRaiHg3B+4XALmAAfoxc7KzrpsDJ2/a+kOWW3qb5jR6aJDq60eRfjfD5rkqs?=
 =?us-ascii?Q?G3WyHuovyYJ4LXO7U70jgss5A4/yzwEJbeFmrefmtKoFBDl21KbzGXGM8ooy?=
 =?us-ascii?Q?hugObZJUgyqX02PahWkQyXAqWacg49TG+zvgcX9QSFpBrR1Ei7uFSNLqZwN5?=
 =?us-ascii?Q?2zsFxoQi5PpOMVpv8bqeI0LHURDn1P1TW78A7Qs3x9UI16Qv6bqR2J5CyOsb?=
 =?us-ascii?Q?yP7QSRUWPQ5Chz37qo9sbaueY25gqy7XdrMXakkKJp9x4UEegFzAFzC4kkhP?=
 =?us-ascii?Q?46edEgH4kdnb+FBcyZsqaO6n2ASjInmRIihf999gIMLmifNjZyij0uWbeFT/?=
 =?us-ascii?Q?bQsM5bxMAQr7lWyiQmxOGBQAue+Hdkn6quy/bcsuzatWTesRIJvU5qIcKfbd?=
 =?us-ascii?Q?v1AZa+3DsWEuhodFDOlyAlSFAgFrOI2lEvUGAsRECqzqA+TKaz0TC3/Rzcjq?=
 =?us-ascii?Q?is4o5SjdrziGB9PvX6thJho70y6BqbMzRhIf/C8Tx1gnOLFFcuzXZiCz2Reg?=
 =?us-ascii?Q?Qi2CTJPGu2c+uziihUUK26Bp1KEqlY5oQZPZ6G32gD/XcL9QykzDc0c4XYxt?=
 =?us-ascii?Q?nQ7wzPkF4SQLA/ZSnOitpsHrz8aNL2CrbdEiqzVqgzTXaHchXErgsF2jLiC/?=
 =?us-ascii?Q?OsWBRQBjP6PBZKCGpMTdBe/Duc2b2j09PTHjG7xeOVGkHGfoiHpch0KKkJxd?=
 =?us-ascii?Q?V/LjrKyz80itJUtvVIB+gRO/V8jZ2kV0cm0kvkTrpHQmWSaTXXE5F46o9P3i?=
 =?us-ascii?Q?HTyE+uS4DE3FvLyfZtKHn0zunLyEJrsXJZnor08K2oTj6c0SWJbTyajT4QSR?=
 =?us-ascii?Q?ge/tB9TmmA0ZFFb4ulmi2QNg9nPjuEMVgQ4XgRda+QvSWMd5ynkCqseYeIpW?=
 =?us-ascii?Q?VlswsGH6Mewp0UbDa/t2TTvnpi03TbJ3C7IZAzhn4vXnaJGzyGLsCsWB/Kxm?=
 =?us-ascii?Q?DOTZk+vXdp6cTL8Vw1jA0o0QcwSDjsiwGBdx8M0ME5c6vWPayA/RLKLU4Gsn?=
 =?us-ascii?Q?dMtaorGwVVJTRuBi2xnxPCDp5XkAHgK9eFRft2+iB4AvGtDl9qxTEkR8BYCW?=
 =?us-ascii?Q?JJFgo9sMLhL1DgGXRs+IqzJlRd47SMOAP28B4jX3xcswjGR1hd1Kr7uboy9N?=
 =?us-ascii?Q?QHwVf7ihN/VBERFc75vM3XqkaN79Aq1UPqMlOARt3iBEunumPaEhX+9yWmFY?=
 =?us-ascii?Q?RPMJqwC+GDRvAnEGDG4qFIxjhpiEqZFPSVVNaf+pXVlMcRJCoiOQ4B3ZdZhP?=
 =?us-ascii?Q?WQmk09fvLszYNSo5mGKQllNNIxmp5te7kMKafXAh6bdHzmgNuGXXDacfW4ec?=
 =?us-ascii?Q?Hv7Y4I3oLLClT4HSjD2C9QBXjtrCdg26K22UxgT2wL/cSNrLaR/X36iAQWDL?=
 =?us-ascii?Q?turScvymLZZlqHnWvF/7oW/QM12uZcQEbBMNE+WLKi5DHCx2pWH36L+aZqqP?=
 =?us-ascii?Q?TaWR/A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KnWZt9oDSFrecbhm32ZtINNH5jOMcr/COVhzavOwruE+jSWa4djjAOOCGOWW4960zr0UfnmqWUJmPFvMdh5ADhQBNgMGe/fFwCVl7xiGr/i12WmZxMh5F/4CttaUFd9gCbramnq0DP6wvYFjz52sktwDjf1ly9ArsnO8nHWzBFsrRbSaOtEkokRy4oDIxkAIpn2Vf/1tezH6agMWdg63ulgqXTR+nvynhTWMKFMZM0+95K1cOIBABGzuKsIm1qektb5fpsG4S3C1HcevL9Obs8im1xd6rzHhHvUmKG8Qd8lxGkJSBDrrXKAgSzcbiO4cX8N0fzuQq3BzCZ41h5lEOPYXuzsquKZM7GlwJEMzGXhKxbOLE1yjaCMcFOVwpn1wNxsDQ4+fER0OeJMBmFWC4kVWSJlKOFqkGoCAed0yCNoSVzFdfq7fUmcxv7kje06q
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 18:19:36.1253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ced3f3ef-7937-46dd-db56-08de6350c982
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4466
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4892-lists,linux-watchdog=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:dkim,ti.com:url,ti.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jm@ti.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6A8DADDA27
X-Rspamd-Action: no action

This allows for reaction control in rti driver. Since AM62L SoC [0]
does not have WWD reset output routed to a ESM module like all other
K3 SoC's and has the reset output signal routed to the reset HW block,
add a new compatible for AM62L and configure reset reaction for AM62L
SoC instead of NMI.

This patch has been tested on AM62L EVM [1].

Resending this v4 since the original v4 seems to have been
forgotten.

Changes since v4:
- rebase against next branch

v4: https://lore.kernel.org/all/20250721235705.1160972-1-jm@ti.com/
v3: https://lore.kernel.org/linux-devicetree/20250707180002.3918865-1-jm@ti.com/
v2: https://lore.kernel.org/linux-devicetree/20250625143338.2381726-1-jm@ti.com/
v1-resend: https://lore.kernel.org/linux-devicetree/20250624202605.1333645-1-jm@ti.com/
v1: https://lore.kernel.org/linux-devicetree/20250624194509.1314095-1-jm@ti.com/

[0] https://www.ti.com/product/AM62L
[1] https://www.ti.com/tool/TMDS62LEVM

Judith Mendez (2):
  dt-bindings: watchdog: ti,rti-wdt: Add ti,am62l-rti-wdt compatible
  watchdog: rti_wdt: Add reaction control

 .../bindings/watchdog/ti,rti-wdt.yaml         |  1 +
 drivers/watchdog/rti_wdt.c                    | 32 ++++++++++++++++---
 2 files changed, 29 insertions(+), 4 deletions(-)

-- 
2.52.0


