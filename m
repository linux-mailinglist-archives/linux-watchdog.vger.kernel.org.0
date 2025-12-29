Return-Path: <linux-watchdog+bounces-4744-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98174CE7201
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Dec 2025 15:50:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C23B8301BEB5
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Dec 2025 14:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE55329E7E;
	Mon, 29 Dec 2025 14:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="WfZytKG6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010043.outbound.protection.outlook.com [52.101.193.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D057329E4B;
	Mon, 29 Dec 2025 14:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767019814; cv=fail; b=H3DFnCuUTrs1qipaz3ZnfYFqk6WtEI3Ub/Uo+5zWrK5wbjNzv0D0mU9WY0HiuekI09Px2EjAxsH5eZILhP8XVuf1sU4E6ovsqZNTsfgGlQGVCzdkJWIxlj9xI7f4h9bB9BJMcY5Q8NfdLrs+ghAH3NzMcudX74kXG96+Ms2xx7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767019814; c=relaxed/simple;
	bh=C/sAl7VPwfUTkSjWIxafMI5oZk3+fb31sg3EEZM1Rpk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O+vvXNt+2mG5jm0F4s1BkxJQ4qwEoufu+Bpy31a958HJVEcHUJPbid4ybDpQt37YgtZz2X1lN499B+unNGlXrv51UoSOP0xmjSKPcGNL0BOzIv+Sqkx5aTLbe7hXPtxWgEkMhDL82IwvF9xdB8zryEGOtViFLPno0Jqaka/ISag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=WfZytKG6; arc=fail smtp.client-ip=52.101.193.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogXrNmSdwNp7RXnqmIY0OcGQyFUeZKEK03GzMvsN8AakDxcO/dtcycIEab1zV+C7aeofwmvxj8uz1jwc7Z1ABxvsNmpxnydPX7zEkrKbCm09uwniy604mwPcP2TKwcEreunyRkkQQUXuu8HRtvawIb1w/OfS7CgkgMhZ37lwTg95XHTFipihz5kBPDsRCNqaEiDMvANX5brbaOdTdE+yMpCjsM9F08tJUIxs9Oi/VI60hAjwgTbFiPlG/60XwUp3WNi+0EMQjM3F8iQG/2V+KpCXMvTOOGwHuH2Krv1s7tsLmM81MWXwp7OXjZRlnxea+ZRyaCngW/u/5w3bCqqG9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AC0k9DXPkS25KziSfwKfwuVOSRTBuRSufocteTlocIQ=;
 b=O1nyGmXLrLZ2zoUaW9MStwzqixASRqqjKZ7rZKkbSZeyCsz9d9bbngc9WcWIBGvnAz0++BaAkVo1nBEDKHYEpeu6k5sV+MjIgel+2yyu/pwxyVEdX8Yx7uMvU1X4fifRzSiZTGK9a2E9l3TniMt5B2P2HpEzNYUBS8rvUrVCAl0LI4H1Qx67xuOkodgVFV/92B0KiSLC/XhUqESNipgi1dHkcb+HXKQy/+P+9fVyE/F1e7Wwsi9wuWxKbok+mSLJ/YcAWPS6w0lkGnXzOtssqezyuUdLt+onKWhPDpJU6OA97TpKli4vaPXM73jyFAZbaxhOOUz05Dl7r1u3Sgg6jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AC0k9DXPkS25KziSfwKfwuVOSRTBuRSufocteTlocIQ=;
 b=WfZytKG6vqYhfXxQ2wQy3VlL9oiuIXe56wkmDXoeRUFcpqeEtzkkuXz/7Q891mZ+6dyEKj5+ZErRzMiBwkXyjqhjrjjtoKKvvxLkZs6zCmo3YR3ODfjqG8C0Os02GFYWPrqqC4ZxFIKwFZp3E9SVD0BtPhPRcwlkXbJ9uIARmLtQ/0R7VFaMed8FeM5nOySj6MfreKoC8Drqe1Skt8Em9WLtVVKXNRQ/yeXdvvqRz9qEvDIp4EIfDSqy6S40EsV2sGRIa9o6kjZ/O/7fbBC0E8vevxLj9DAhuji/vK9v6pOa2RLBYCmdkOjWtUJKL7gy6OJmrvOyAmAoosOcj0eC3g==
Received: from SJ0PR05CA0089.namprd05.prod.outlook.com (2603:10b6:a03:332::34)
 by MW6PR22MB4322.namprd22.prod.outlook.com (2603:10b6:303:24b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:50:07 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::5c) by SJ0PR05CA0089.outlook.office365.com
 (2603:10b6:a03:332::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon,
 29 Dec 2025 14:50:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Mon, 29 Dec 2025 14:50:06 +0000
Received: from podman-dev.fihel.lab.ge-healthcare.net (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id EA815F2E5C;
	Mon, 29 Dec 2025 16:50:02 +0200 (EET)
From: Nandor Han <nandor.han@gehealthcare.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	nandor.han@gehealthcare.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: watchdog: fsl-imx: document continue in low power mode
Date: Mon, 29 Dec 2025 16:50:00 +0200
Message-Id: <20251229145000.421426-3-nandor.han@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251229145000.421426-1-nandor.han@gehealthcare.com>
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|MW6PR22MB4322:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: bf964329-3970-4168-27f3-08de46e98ed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iMdscb5eqFbmKbELjf/Dihws+r7vxNy0pAgOeDxf8LtmGT7UcW71xjNWdW+T?=
 =?us-ascii?Q?gmm6JMlx+N7IvceVMfGUfJHrnHBIbv9+PPJWjEqDV9N//j96pRzm3oRGBSjL?=
 =?us-ascii?Q?wZwfORfmlCfyIJ+1yENVq8/OxiD3S7VyYkhi1ZDqoBhkI6SzbOrGFwBSAykQ?=
 =?us-ascii?Q?RJ+zWjO+40JC7gYulQ3jSDVYJUKCbiWpd0LZke8/HsB2+ujjJaazYa6tZBkf?=
 =?us-ascii?Q?zaUholssrJsgu6OzdiPZ/+5M0YZHnbS5+RYdiiYpIW7cPSS5HFn41qpAh7Ag?=
 =?us-ascii?Q?Od8ZCfd/YTlO2vuWM81ryJYyArCxK8KJJx7Wrt4ntEshPG5HtVGMZTkFjokr?=
 =?us-ascii?Q?w5t9Tt5eb7kXyyEHxKRPZ0RAuzfzVlhrcK4ZH7oDoc8VNRmuXZ3ZoCpGBtu2?=
 =?us-ascii?Q?aMYgKKeiEU//02VjmH94cdsS/RUJXk6xmQrQvyGvM9lHNAhYDrExQzHG4JzM?=
 =?us-ascii?Q?C1UfEpexu7nqPGDNLywsEzB3Ay2GdA8Yo1XV1PmMCHaLqn8i2kMqAX5ReYZ0?=
 =?us-ascii?Q?p/+nYhkghe5YIIaHLsfDDzNmphFOTvu/jcProFG8m7mlRsGwSQd63zvv+lRm?=
 =?us-ascii?Q?z5Wg7tFDd7uUbG5FkbGzGhkhQwQhxfebPO19jTJiOthIaqCotTTVAXQpXC7u?=
 =?us-ascii?Q?BlTe1gRRdR9CMyzJX9ZYACrpqFHN8bWUHmIgo5GQztNUrl+b+tmYjvahsXZd?=
 =?us-ascii?Q?fb+WJ0mxQRT/Hw4gkid2eHwYQm9Cz66emNAn7Nfw2Ug+L5eEbOSPbbFO4bW9?=
 =?us-ascii?Q?n13+UE+HPpANS1pAzCxSE1upsqCLC19EQ9a/gQBJSmqHvOvxqCu0Rht/1ze0?=
 =?us-ascii?Q?L1x2sMJRjz/Ag1BMxSO/x6AlJH6kykqfJhin23UkGdWNQig4/8BErVKs6BOS?=
 =?us-ascii?Q?57vEq4OAoxa1qc26kW/PBOYkiofYhfmsWiw+cwv83siUP+zCANjOhvGGW0rC?=
 =?us-ascii?Q?0DImlplzk+0T+cCmHRjC5Lg2izYyEh0mprm9R+kXqL3O0lFSZ/77GBRltGG3?=
 =?us-ascii?Q?w0NjvSSBXokW+Pb9ZZ5UU3qH0v+71FjL2ZXxt+LlkG4ilimurHI+k7SKnTZm?=
 =?us-ascii?Q?vqt79gMVTJR5JanzSFK8AI4x8/3Q18HVRgaF0Cx32iFE3aw/7WtB+QTpQek6?=
 =?us-ascii?Q?cD2azUSos+JW05nbwM74gA+AGrs2JHAGKutYLfXXASDxvvD0TD3QGL7SJmlm?=
 =?us-ascii?Q?eapjaxwARK5/R00yKneqxsVfezvhtp+q0Hr+JwZS4nwUPo9G9eMwE7T7x3AH?=
 =?us-ascii?Q?cTDICMgMhpYyccWhsaFgYTMGyGCKutUtUl9BScMspmwQlyYGUDMHc3qyrYVH?=
 =?us-ascii?Q?MoypIQgRi5vFYRBYjfFyR+2Ty5VjKDxQ4Wq6EBIzy3Mn7LDuANFbs80LRJbF?=
 =?us-ascii?Q?aMPTh1FRUo0R5scRfi5Ee53LRnMCDzNmVz30ty1b07zITNXrMo40aHJgjZYB?=
 =?us-ascii?Q?hXQdcUFxn5snSjk77o2fSjorv8aZOSPIqG/3bT5kZDp6sAVsv0YFDLdWczG0?=
 =?us-ascii?Q?sMgHioJ59xmv/b+WawULZIBY9q39MFJ0NPwFSR+nMZ942Va2GXixPKRFLfpC?=
 =?us-ascii?Q?GoeldCIsv/hNgyOzJjE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 14:50:06.6997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf964329-3970-4168-27f3-08de46e98ed5
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR22MB4322

Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
running in low power modes (STOP and DOZE). By default, the watchdog is
suspended in these modes. This property provides the option to keep the
watchdog active during low power states when needed.

Signed-off-by: Nandor Han <nandor.han@gehealthcare.com>
---
 Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
index 34951783a633..4dd9cc81c926 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
@@ -64,6 +64,12 @@ properties:
       If present, the watchdog device is suspended in WAIT mode
       (Suspend-to-Idle). Only supported on certain devices.
 
+  fsl,wdt-continue-in-low-power:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      If present, the watchdog device continues to run in low power modes
+      (STOP and DOZE). By default, the watchdog is suspended in these modes.
+
 required:
   - compatible
   - interrupts
-- 
2.39.5


