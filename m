Return-Path: <linux-watchdog+bounces-4894-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGSPCF8+gmmVQgMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4894-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 19:28:47 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 389FCDD944
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 19:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39E623180D4E
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Feb 2026 18:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142113D646C;
	Tue,  3 Feb 2026 18:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Mkbvac8m"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012058.outbound.protection.outlook.com [52.101.53.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3365B3D4122;
	Tue,  3 Feb 2026 18:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770142784; cv=fail; b=XY6OHxITgmhL+Zmiw0ge1rao+2L7Z3wE1Vsluf/6EwRtnSARxm2AzNq4/Eqf+MwufN0gJX2zd0PEWLDkMxxlH//gBSV3qsU0a9r605IKTeNxVvLcdS7S/nUrTBPoPyiSHuJT+ihi5uZLEw9NBPM/ZyflZxmkXk+UJSSwCysOc3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770142784; c=relaxed/simple;
	bh=G9AHBBLxJbs6gdhUexcLnAxBx0/GTHR+e3DVffYLaj0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PpDOiEGb6FYPllK4VlKz1uHtirhYED9cm2aHJJeggBOUHmOnSWUD7MWusSuujt/MITy7W1oHNw1rsIYFDo4/8s0Dm5tTTLUDK0g7Zssky09mlYSBqG372OgfozpVwhWuNPpZDn/ELNaqXF+Ig+AP04JVlEzeCtffVowgVCfRu04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Mkbvac8m; arc=fail smtp.client-ip=52.101.53.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQD/9Bi4C4BvZN2tQl3vIhpC34hZS7TPT2RDnnePOd0EsBqSRkKKN99bLSUURJIN8QWdk7n74/TaaegnwJl7RsRibaqczLzlZUiaMHrrL6Ylb0XT0L+ImFa5lsle/rsmrZpHWreEXSNQG0NAj1MZTSUIL8s25jPLbfZNEMRDQVXcAELztVJ48SeVsU0xiW3SB0jwwn60Hqo49fic5rq/xqCwrKIlMJNpYPG0L1Atn84BRTBtYWGOMhsWh3UA7ydN0LmI9G2uZ25CNOzuZv5vtnM7nkrjaykD2Ug+kWIvP0r6kwgphSooi3uiHU/gEoZMkeKp2Q9LGqmltBoyGSv/Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0maukgaTBJMBkwEeM3xkTA1Ai63ixrfqSmHoANZji60=;
 b=CtzccVuYzClW4IWkRxFJVFPiYWo5ZqXPaJHDbX8bnapf2SgFC/QVoiJyhkOcX/vTDTLkoHvzHavq6lmvsh11cMFqHA6O9Ti7NQ9KrSDFHl6KpcAy9usIY4K0TB/UOqyd7rWyGhk8PLQJFkK6ci/loU6VOKUV1vezyqA9MY1rzdd7seP/tQCoK13+jk28RRVBb+Sp9FggPNMTVwc0woVSYH5/rObsD3QcJhvXd35L7ol7Y0ybA0IsPHiPPVi6JyC4C3ZgFJiHtUW1uiPk8C67F1Rw6ategFr8A73+WwQww5uGWzG9q0l/UuffkFs5g5FrNXFg3/5/N+zxJwtPqa8IBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0maukgaTBJMBkwEeM3xkTA1Ai63ixrfqSmHoANZji60=;
 b=Mkbvac8mcOzaCWpmOVIf6r9dBJZhntrNnNQHAiH2YJKMELLa1j9tIqLjpJrA8/C2i+zq/90GV88n6iAzomFMtFm7LLBkzpqo3EpTvzCCWBF+9FN8szkvhxIXX4fAhj8uJZG2/AdljTGZy4rHVf9SIZVkwLtoNIkFSfJ+pW7efzA=
Received: from DS7PR06CA0005.namprd06.prod.outlook.com (2603:10b6:8:2a::20) by
 CO6PR10MB5556.namprd10.prod.outlook.com (2603:10b6:303:143::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 18:19:36 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::e1) by DS7PR06CA0005.outlook.office365.com
 (2603:10b6:8:2a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 18:19:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 18:19:33 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 12:19:32 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 12:19:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Feb 2026 12:19:32 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 613IJVHu181632;
	Tue, 3 Feb 2026 12:19:32 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND v4 1/2] dt-bindings: watchdog: ti,rti-wdt: Add ti,am62l-rti-wdt compatible
Date: Tue, 3 Feb 2026 12:19:30 -0600
Message-ID: <20260203181931.1496723-2-jm@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203181931.1496723-1-jm@ti.com>
References: <20260203181931.1496723-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|CO6PR10MB5556:EE_
X-MS-Office365-Filtering-Correlation-Id: d7b63305-7665-4002-1f21-08de6350c7ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5fvOA1pbuyM8BC/oQhB3Wd+wo+sgQJde2M7n7IIFkkhAHYAoSTvMQUztCgF7?=
 =?us-ascii?Q?oMUgpYC1FHesTa9Mq5bpOXTMgA8cbUSbC0hBxvZC4jBTzduin5TnMgjqVUEt?=
 =?us-ascii?Q?tGZcrjORqOaIwXMb6/CvwgJsDHxRypTONb8UX6Qg5lfmmzUr1INQydxHuV1v?=
 =?us-ascii?Q?JxCxB6AsE5GKcrI7s+0ZpCh4lMesr1/UtT/vAOEEw6mibHyg/QAAbjcuP5Pe?=
 =?us-ascii?Q?Tbcq2AyR3IPOUuaqf5UCa0tXDvnn5hdHT4iCVQfqbIopxIN3n7urGodnqUU6?=
 =?us-ascii?Q?XTQRKAVlmIiwFVBAQ506o5lBZQUAQP3nHUh6Z/fiUsotRB+gQibzlAoOyfOx?=
 =?us-ascii?Q?+MUAWifxnFIrw4veH/P4Yy7iZ7cQuV90V/fenA8WNBMlJgo7lp1afPTkzGm6?=
 =?us-ascii?Q?VRKf8Fljsj+eu5X4j4rBs/QG/4h8cj8SRdiDBwTWeFqw32kaQ9OAxTiK+fR7?=
 =?us-ascii?Q?DAOd5CvEhyWYrIpYBVyEOOI6sPYV/6gCgkXLSHr7c/R2Ty5IZXxGiVTIng3T?=
 =?us-ascii?Q?hI4p7AS3H9abvghufpyciD2emMGGcYk4eQVhJvNIPPgmsk1Tf0EOfOyp5ERF?=
 =?us-ascii?Q?0kQn/DlfQdBj9OTbmRawn+1hPNt069CI8tBK2sWXYqfh4eQcB7UmcU2GruMD?=
 =?us-ascii?Q?zD3r79gx84TwgIOY7L4yXYSt51fuLdc0usSoIYJxsxZ1cIzUijdGkjOWLVpJ?=
 =?us-ascii?Q?TRSiCAZrLjCL7L2z1XeQmMeC8W1s2jRKrWDRjQrQkXDXALUV+tubkQB2h/Yb?=
 =?us-ascii?Q?u+7iUiZgYjKyENIx6YIhsAwVxUbQuot/CbRjz6/KudLbEA3y1xMbIXw9rVXZ?=
 =?us-ascii?Q?fIMtS+Ffrfuo48fdwNu11TbaEU9KEpfA+EFCVin3k5ddQc2W3qXpMXs85wbS?=
 =?us-ascii?Q?O0OILcAPZSCamtqtZJZldrkI32hx9DNlTMHTpDFSUOR1F6OMEy57FK2ZyLdq?=
 =?us-ascii?Q?PNTAGPsBArbPHFhiPBE30VecDYcy4N8OK9mymQYojZjYVrfiKthqiSsBRGW2?=
 =?us-ascii?Q?S84aZxFpPRcHHKDAcX3h5JXEalIW9Gq6It0cI0N344MleiUtMuxkN0FQYWmt?=
 =?us-ascii?Q?lSN1pmCWIrqvcaJLaD1dxRSrfhel7F9ravfTxunYC2Hz88dQBsyOvyLRhwjR?=
 =?us-ascii?Q?LlrEaPgaJW2ySVpB3iO24tu/eO/DLJMjiOtEVmZ6ClW/2QHxuNnNtTRwBF4z?=
 =?us-ascii?Q?KlA525BWnXzt/svqRrcWoppld7OGyyP0uIqylfs84ak1YD69DbPYVMrq/3V2?=
 =?us-ascii?Q?+O+7hA0bxL6O5GXsRbn+PwyaBsaAv7MvRnbYpTKOIuFRWLgfCGQAKe8MZeZ6?=
 =?us-ascii?Q?Z8iitfNEJ559OPXHlTrwLGQKt0I9hJX1TbEnSmz5tdWU+rtU34XHGtO8eCBW?=
 =?us-ascii?Q?x/c9GgzPyTt/MeENUwtHCfm6jzvqcKGndar+yJHrgjp1gZfUrCT0zPIF2s7C?=
 =?us-ascii?Q?c6TrvQOnSPeSqFvgPVQh9Bf2sqM2u/K3sPHRbZEkRxs/I9kwjAmIaCUPhLel?=
 =?us-ascii?Q?gj7jNAZvsko9GF4/B2PHiycS46tpNsq5II/r7iIO5+6A/1XT+6Fqzsy7nmeg?=
 =?us-ascii?Q?HSQo6sIg3bMjkgGLz2hCvHwg2DaWDN8YgCd0Wajrmru0BR/rEM8/btnf3v+t?=
 =?us-ascii?Q?4+EjeYUckLbFPFpT21dsqeSdmBapl0C/70ZUErlWVVCF4OJYDpW0zWYybf5G?=
 =?us-ascii?Q?mLrC4Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7DEZ263CV5HWhXIUjQa073/pOlMUMKpGf32AK3f9r0q4zr2KV3yHlJ1M0bj25CXC2JGloBs5X/OESua73wjy/NINk15q5oLjf+Y/P6WUpIUESJPWhpAtrRJjg/epy9W+Zy94D17nnQg32GZ2HaWAuyevxJciOt0ttpMhztt1BYVTnhnHoP6F9c7WAJWJ5L3gizsO2+amgvw9EOunJkfGxNzi9XhKmoi9TH+/OYvYZF0xpIr+IQ9UKTSzHVwNO4Oy+tOwtoWbUEEhWHJ8UCnN95UZKJxBB05q8YoTbhOceyH4LufdcBS1UIcGR4wrM0Gv8QAC2s782gWwvsWqdhZocDFTrWnHscUsmlFZQ9tB0fUgXF2Voy+TGW9T3cEEk9uzO07nWPec+quHcDNjeF0U9q7C/fxbfuz/MzF4ua3j9hD4SQgGezeJBcY/SC6wurN8
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 18:19:33.0642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b63305-7665-4002-1f21-08de6350c7ac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5556
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-4894-lists,linux-watchdog=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jm@ti.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:dkim,ti.com:email,ti.com:url,ti.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 389FCDD944
X-Rspamd-Action: no action

Add a new compatible ti,am62l-rti-wdt for am62l SoC [0].

[0] https://www.ti.com/product/AM62L
Signed-off-by: Judith Mendez <jm@ti.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
index 62ddc284a524c..2966e5bfb6c09 100644
--- a/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/ti,rti-wdt.yaml
@@ -23,6 +23,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - ti,am62l-rti-wdt
       - ti,j7-rti-wdt
 
   reg:
-- 
2.52.0


