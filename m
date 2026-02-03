Return-Path: <linux-watchdog+bounces-4874-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPGGJ0ZNgWlMFgMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4874-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 02:20:06 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C804FD3505
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 02:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B0D5830074DD
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Feb 2026 01:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580042288E3;
	Tue,  3 Feb 2026 01:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GM1lDOjb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011036.outbound.protection.outlook.com [40.93.194.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB933221FBA;
	Tue,  3 Feb 2026 01:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770081599; cv=fail; b=hGS5rsGs3FMT0w4uoSgBBELaaWpQLNyJFm31pne1ZTjVpuDgFDkQRXl/8ZtAaBJsKR2VBWqmXYSztkbh7tZSXz2kvQxVOjSYZKCydXJWgO6R4R7yfgkE/p/3JBoDzFaNHk5Of5r8H4pwPmlUVzUyGAQRc8wIx5MnqfG739dJhlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770081599; c=relaxed/simple;
	bh=alcBei9wUotjLkQRDeaDMUSOJCCFHDtVJKgB3ujwFM8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kzqmazarckkNSrfpgiaNoal9fgXUcx66trjT5kB4pMYoX7TfRqKFGpab5MaSqpWfp78keQfUBIDdZiPmXLehAb7iOddDEH1mZHJfTbcbQlUVJSgqxyfCkqMKFFw229mX6QwOm+2h29EPiuGchrcWsxj/WPsWHPESfXYrP+pOvok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GM1lDOjb; arc=fail smtp.client-ip=40.93.194.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vyV6Vq4GTq+TJuWyw1RowlZvAV+5PRlsHRu35EPa6AgJkUDbz68xpFST8irLzC1unsMlnL4fTMlupoC4+glvBAfMJ6Q9HvGp5KYg+T/bc6K8TbWS9D43Jmgatvzfy3BJiHC6PjslzZ6G2/NEC5bbafh4j/88gAhOgURhM6HdMWBJNXrPftf2SuOIsgw/L1Ke37hFb8AC4oBJQf2O+ln42wC7QuHzDD24oyKRc/Bj6dg95exaFKS2dc0/6Cpj8uPgYWtSbalyO077TR3deOYmsiLzIeb19SjuF9gDaHIFpCzi1/i9epyfOws2FxlEdA0F5xts2kxAWuzEv41wNfbQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ET9BIPeOh5NDJQfhVUhvFENBMlD0Uir9QpeAkAJ9+fg=;
 b=YcAWqDVjnXOXCAgsuMfIphA7rKi3t+RljL/yg1PWzosVl/ImXw9+KWmvVhIgjLaF2Fi1Xl3UzedrNPshmeuakzpzXaVZ4vOmRKVLEvD41ecd6F09+hu11RcRWGHIH44ZvcupiHJxoYEgoxCoyyeRyv/eewI4XI9DTXY7hpbtbi4AIsXpT1QgNtgaqtf4B2asT3V6TUrBZJxdKl4i8VtTlliCuCKVzQLMWZduTt7ZVvmi8FW1TDZa+6/psg4gncYVXTR5WzdR/4czpfjhMiUrtgdR9IJR3muC6jqWUX9RfCEJK5VM7kTEkxjDhhvC4KCp+6rsyuG4mYiFz7idj2kdoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ET9BIPeOh5NDJQfhVUhvFENBMlD0Uir9QpeAkAJ9+fg=;
 b=GM1lDOjb3BFPnNgz8f5faKhdvYo0BUnVQY615AQqR17P/XOfeC7FDZHOTGuRRiDHYiMJ/MKID/+XTm6L41nUnr3BuY1SzeSsoGK7+dWJDMTZnXZHjXPa95PJ53RwLU/aO1giQhGg2mZkMAsTn609px7fJgxDb9rZfJkYrHzR3/Q=
Received: from BN9PR03CA0642.namprd03.prod.outlook.com (2603:10b6:408:13b::17)
 by BN0PR10MB5143.namprd10.prod.outlook.com (2603:10b6:408:12c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 3 Feb
 2026 01:19:56 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:408:13b:cafe::63) by BN9PR03CA0642.outlook.office365.com
 (2603:10b6:408:13b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 01:19:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 01:19:54 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 19:19:40 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 19:19:39 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 19:19:39 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6131JdZQ3094273;
	Mon, 2 Feb 2026 19:19:39 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: watchdog: ti,rti-wdt: Add ti,am62l-rti-wdt compatible
Date: Mon, 2 Feb 2026 19:19:38 -0600
Message-ID: <20260203011939.1013322-2-jm@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203011939.1013322-1-jm@ti.com>
References: <20260203011939.1013322-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|BN0PR10MB5143:EE_
X-MS-Office365-Filtering-Correlation-Id: de97de22-5cc9-41a2-e0d8-08de62c2568d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k4GAXQvDGg8wdwHO2fmhtd2xMz5AsQ0QjXbzIl34HcfOXuOHALLVsBUFeXCZ?=
 =?us-ascii?Q?EuKu5Uh3xXko9LWZWM6csCvDOC5AoyRryI1KBr/yIBiwgvDk/f7pZmtEqV+i?=
 =?us-ascii?Q?c64IWc9KkDKqTFtmzdJMRqw3zdQUISkntMc1VZbDB8IDFvCO0kRkZs7xsQyW?=
 =?us-ascii?Q?iYNdVlv/3jVL6QSQrP4g9cOhTZAqQz74KL0c4rVHU/df28HGNv+9I8pe0Tir?=
 =?us-ascii?Q?KjC62qR+IrcMXodH95UJxDRIFR0DqyWGslgsJ5WxSmiQNsjAWqG1myb5k/tg?=
 =?us-ascii?Q?qsVAIxdEqXOS/x0ru3k7ibmzrKaPVr2MBRtc2vX7cT902I7KFUJcv86c4oEQ?=
 =?us-ascii?Q?AGdTcl4ojC+jxfuzJv69a8z0XJKdlAkZdBdl7Fdz+zRmmnAfQzb2x3ILx0b1?=
 =?us-ascii?Q?JrqBhpcLRxgrb62HyBHGvU3g4fzh6qYna4ZY3VWSY5sXbcf1FT3mOoqPfU6I?=
 =?us-ascii?Q?Mym/0jhNb1MVMSiPGy3U7WMB7Vw5sOX5tvIgAwAKjLE7gbrezCvoy8ha0p8O?=
 =?us-ascii?Q?m035YO+Uk4k+3O/PjTnJw00tPAfJEM75WDJQ4fchXwl6VJM0kbBtAST13b8b?=
 =?us-ascii?Q?bq6ElO28Mk+59LW1Rsbvgba5mxYv4mCJ0objcP0CDp4gkI8wNHHxXnZUo6Om?=
 =?us-ascii?Q?8s0m3CybPCo1EyS41VAd1vkM4mxnhkUtKQ1l0HQl5BVCftYXFpsbq04YPCow?=
 =?us-ascii?Q?vsAlQjghQCwAVII0l4BCJhnt8odKUd9MoIx8DMikj3P1wqGbY2oFTGySl0gF?=
 =?us-ascii?Q?9hI7DE6zpZXxhiVBFhjIgc3lyr0we6r///HrdtLJh6bbyZv9GKt2ehvaHU+e?=
 =?us-ascii?Q?lNIJrQ/XXYCMio8DTrx4NaUEsu79DkuFRjn36i0xwbkCDSOa3P2y91RxJZxL?=
 =?us-ascii?Q?KsZORpxT1SOJ2WV12YX44P+43bnWuGcnZJ32nfg/Jiu9B8CqUY2p8EhJ5sR1?=
 =?us-ascii?Q?Nj2NGMhp0eZ4q0relhRwk4IYPZuUpQ0yo8uevhGiU4/kEokJO4p06bjOFzW6?=
 =?us-ascii?Q?vlVjK/rRCkQkE/5ANI/dfoItQTeHG8efPMtXMoypyVrCNKwEQNvuOgKF8M5U?=
 =?us-ascii?Q?vLYspGe5MwF2mHMRNDR3ICo6zClMxHya7DrgiigcfgGx3g6pSSYzxJX4/7fz?=
 =?us-ascii?Q?7l8NuE1iYC+jo86iVkHw2rOasKEnhGmt4qGt/t3W4+D2+mh7m+wGPZy+3KAf?=
 =?us-ascii?Q?7XXOofdKswPCLptfP7dECfwe+61qFPtUnBibfyCIvXFhabCbD+bL74FoMUCQ?=
 =?us-ascii?Q?Jn+sqodoUmkgVnkOsYr0rTOCqzxF7f1iI8vAFyPB1ICZG6FMRxJk0m7OlGbs?=
 =?us-ascii?Q?hmT+RmlCGvXM0xEhtDG3sa+iunyLfe7ozKUFNSFhEkkgxhKF0voHU9jSm4jC?=
 =?us-ascii?Q?o0o/aV+tEBaZpqVUgCN5fL1D+d8El24nLaXvMFIuZyz/Hus4WWXKIzvLcH/U?=
 =?us-ascii?Q?oonL4KOlS5hN5uG3cZiKwrxiCjlu/EkKhScruOWmhOsPKerGO5Hb6YSitiNV?=
 =?us-ascii?Q?O8HK1WrY99AzDZFwt/2OUtzHWZUWpMMqVn6Ve/hhhtlKBEi7jAVCDrFl9zOV?=
 =?us-ascii?Q?t4ypyYEFQgajvH4j9P/r7K5vyBZ4Q27lUFWT18X7YqDUik8KiuKFigNQBaau?=
 =?us-ascii?Q?Vr+TV3ZQCGluQKNqgSr3qMT8lMy35Ktqo1UpgKCz1Vt0T864/Z3R1J5j/kfy?=
 =?us-ascii?Q?WkabnA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+Vham9IOcsKDTXgB8+4ek7IKO6WlzqQMdrB/bhD+qsY8lgglONQs0eAqsFexRe0I65G8apelHmNlIOyvwYaKsmZBAMCuCuNdv136JsMiIwQiAhq7ywA04cO6oS/WveINf09qHtvX66bwVd6irqPxo0el54dalgi8s+V7c2GsLO2trI3jkJkF76JrNQK18281AFOnwPai2vlPjFv9FiqvUDjvEK9IIGm53R+iOphH19svufzRhnqba/pGPEG17SIuI8jdKuESCaw2O+rSrNm3UMOJHP5kxDZMrcYyykD9cLQ5wPp/pMgZU9OlRPowVud++CVPeUV5lyuxWvbDFbA9S7rbcIu2HJpeOI+QG8jhPnvu16+q0F5MaofqNk9LS7XNecZyPxtYy0theIsHZTe9lG5fYGYA7JEfQOisRD3bhmgdYV9NEdWj3vFNO+sC+10q
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 01:19:54.7287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de97de22-5cc9-41a2-e0d8-08de62c2568d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5143
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4874-lists,linux-watchdog=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:dkim,ti.com:email,ti.com:url,ti.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jm@ti.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C804FD3505
X-Rspamd-Action: no action

Add a new compatible for WWD on am62l SoC [0].

[0] https://www.ti.com/product/AM62L
Signed-off-by: Judith Mendez <jm@ti.com>
---
 Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
index 62ddc284a524c..f57d5c2b80243 100644
--- a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
@@ -24,6 +24,7 @@ properties:
   compatible:
     enum:
       - ti,j7-rti-wdt
+      - ti,am62l-rti-wdt
 
   reg:
     maxItems: 1
-- 
2.52.0


