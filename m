Return-Path: <linux-watchdog+bounces-4742-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22245CE71EA
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Dec 2025 15:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D51393002FDE
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Dec 2025 14:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910B7329C7E;
	Mon, 29 Dec 2025 14:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="fkcsQtzX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012041.outbound.protection.outlook.com [52.101.43.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CEE32939C;
	Mon, 29 Dec 2025 14:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767019812; cv=fail; b=IG1GjCo4i2ol8gQ7ldcUlUmHTdiphGUq/sa10HY8wyXIHdFrG0d2dsngVAYPLH6behG2saGQJ5FkiD3m+6omwRRJpKdEhyxPtYqF+o7uQcbJqp+FNBmnJ2lRx2/jSrhQw3wNxl1W9WHuhNoNoOGgibZsx7gaPF1pe3pYvR5v2Bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767019812; c=relaxed/simple;
	bh=rS/dSO2ti+YYBFE33QP5JwZ2hZ7NUIaEzdnDcblrEkE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=j+2JBA2q+Fh0n7Ehpx6S1eVFoQyQPa2KzT4pkV7C0atKFTlW7zu79rjNuwNe9u8SA8Ji+wtXEM3Jsol6H/m+PG9Wh219RIDOgRjH0diIcq/7p4FiZii/1ORCiz99Li0IagYdLv7o1o5yDErSuMRTWmLyAwCpRqKoUfW890UBUFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=fkcsQtzX; arc=fail smtp.client-ip=52.101.43.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vf2LWcmq+2FuB6mNSSc8wEfkEEhFBh/jTOMeuFHEu1YfhnYgYIjVXSbtQpex7IgssfClcCtr68UE79n9aSWTNvbH/PBDbZRN4vwNbDUtbDF0PjWA6/BToO7F5v14A1AvS8PEuDYBKR0fBqWYl/8SDVHE5Sne+Y/8EKrY8AO8+FfksxiQEWfRsFItO3WnOngfRJCX339PycCqDCfdaGps0g0zuNDvUabJHBZ+jXrEkSLT4z06I3gm+aqL9AkK/cMRdr4nx6QiRLjAs8CUpyx4B4cqVpARWfhNYg6wNFCU+GCUGQLTF3GLD5oBiivwDodXQ6zazYlDcQhys8vsdz3toA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYlHtv4rAWJbRZg/DGKugM9OAyUI3ck+rExSwiSoGwQ=;
 b=EuH/H96JGsRHAavCJ6J9/lBNjGkoSPxHch8SW4GMxMaHL3cL+EuIfdox5XdKGUaZCxXFcSvh0JpS0IGO+mlpi25qw3GJHD203LsbMOHwa2p2yMQBKvo1OmIlwW1IDsLRQfRcpPYY7UKKwG6j43Ga4S/B+KcmeCx2vldvNcU6M9PbdArquXFwEHo2zY4ZG7b46oxY9GYM35ncccNbG4uo6z++ewja7EPXFKjngTH1vEE5yqn3z0aCwv2ck81USGMaoxYDlW7BFqcW4X6KBxSU7rY1k+tZXk8xoT/0CWFYBo9rhXSoyj5ER2UToE9kVHYK4XIOmK9yE7Z2er7vgFFAMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYlHtv4rAWJbRZg/DGKugM9OAyUI3ck+rExSwiSoGwQ=;
 b=fkcsQtzXN+22aNQv+s/YdY+k4ZJ0jGbsDgqXyYezQ5K07+euTqHBSBIZJERyTx4q+dA8c5ntbCcRGQAPRJyIFMfDKPk8DXMxpoNjtlqxT0CVqXE2ZDJJkcD5EIYb34UZFAtJr80vZAovk4CQ+bkrOoRnOnPiygQ/c4g9BSwtueU81cU9PonEZfFs2QH8Dxg+qNFskQCSti6Fa6YmaGEN9qP7glM0NS+4S77+hfd91mMeWaMdheclRz0N1pkg5mxuVwFYcokQWRTewTWyQqLVYxSo1/MjshpQuvlVIasJcOesrH7i/XYhvp6alXOykAella6f6dD2jTlm4fH+r4KNMw==
Received: from CH2PR20CA0025.namprd20.prod.outlook.com (2603:10b6:610:58::35)
 by PH7PR22MB3662.namprd22.prod.outlook.com (2603:10b6:510:1d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:50:06 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:58:cafe::c1) by CH2PR20CA0025.outlook.office365.com
 (2603:10b6:610:58::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 14:50:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Mon, 29 Dec 2025 14:50:05 +0000
Received: from podman-dev.fihel.lab.ge-healthcare.net (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id DE835DBCE0;
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
Subject: [PATCH 0/2] watchdog: imx2_wdt: Allow to run in low power mode
Date: Mon, 29 Dec 2025 16:49:58 +0200
Message-Id: <20251229145000.421426-1-nandor.han@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|PH7PR22MB3662:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 26fca080-1ede-46d0-d927-08de46e98e2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GloPHJbaVhTjLUanlVirZ0d+1rAJd/AwiUeyO+i5GH7vru4/EPt+NYj7bjNO?=
 =?us-ascii?Q?42vKulUf8gdS1igR/A0RNPNZReHHqKGB0qKEvmPEAAgKJbEDkDQ1pluPg/+9?=
 =?us-ascii?Q?r0gqD8X6KKNeeIoZpgO+uVNQCUB/k7rVFRJs80KdBIkfLGlKEX0HbMpC8/ac?=
 =?us-ascii?Q?kPQnJG6nmFBxAW8QTr5qP3Ecypfz1+CHPUP734dsURcw0RgoyU89UdVJvqF4?=
 =?us-ascii?Q?6KhpMSwIwkN6idywUXQTovf5nyxJ1AjeqbysJZ76Pc5CCEdmBAldx9SG20uJ?=
 =?us-ascii?Q?4aPbbg614uFewiHHx7PyJDuKkboxd0W/1q6/iuvvv+UBsShY94U4Dk/Y4pdE?=
 =?us-ascii?Q?DYAxuqmNbNaAZFyOc9DwEjC8y5HSbwnVfY4iWtgdx92x+gnprcbEc7xYPdtR?=
 =?us-ascii?Q?xEMOJA31JMjLpRqdvPy1EMJ5RppXH09XPiqVdGXycQ6jYi1/hi05PXyHeAGU?=
 =?us-ascii?Q?Msb+4t1nZ5bAs1n8ID1Men+BdDhqoGkZb8uP2LusLUPgCYdLQzVig1DeCS6m?=
 =?us-ascii?Q?DROW4br2k7ldg31KzeKzMShtQXpe9w65KfNDElamZKxATVyRaRUW9RJS6+ft?=
 =?us-ascii?Q?2vhKi7HN5hpm5Wyh7AmRUzOr7kwwt2HgTA/zx8Qlluo0f+3CC5Xc2tIautZ9?=
 =?us-ascii?Q?NIqYZ4wkY71ExPbtZtXTB4FrzErmgIe5Gt1l0UlvNIZbBWBELxm4BzsYXwv2?=
 =?us-ascii?Q?c3hUha//wePEhUkKrIrObi/fuLpMe7lz9KYKBQROaKpo4h5Zgv27E0frEeXE?=
 =?us-ascii?Q?aD6TKCg9wpO6Wqy/WdMnPhIKDuO1S9LsSwslGSvh12lvmL8T///+obiSaMSf?=
 =?us-ascii?Q?DOabdCSYIzgFJTX4J0gxYuOu6gi+KAYeVJH0c5896oWuCoqdAJDR67HjQISx?=
 =?us-ascii?Q?BKlcN4SzZW+DF4VAtzzQYdDVktwIdyWUgcStV+FerO6RA7xDqgu5eTnI4+i6?=
 =?us-ascii?Q?7VagYuKouikXbkOKfMUiv+3M/laIYrR1bygQ2/XXweHSYj3OU2Wy9dDl9BnW?=
 =?us-ascii?Q?3PNDhL1kVkXJQWduNiLuylAFsW0HWmuWEpCIiwWdKxJXO36Vswtf0j1F45kf?=
 =?us-ascii?Q?jYybFAi1xg8Un7AWhTyi75IblAG/K9dRFEsKpyh3gJi06XQv4DvQrq2FGw42?=
 =?us-ascii?Q?/rwTwqPtj7Pqgeatr9hAzNsV+GYzixI2ZxLhQvwG332RvxKxy4vb9IP6rQtz?=
 =?us-ascii?Q?hQBvfh/QoGPTtQ5wBujmW6bpGmDn8Gwpy/YFh0HTC0qsK9xg5IEH2eBAY1hb?=
 =?us-ascii?Q?QLjAjZPSP/5fzIURfpoS9D+4IfJwXRZiNuQZPBniegnt/xs9eWviMlhmDkrU?=
 =?us-ascii?Q?ATVxEOwnB07eToL0ACRyoqk4kWVSShTNEoUjY2CvamvAsx0n4Zoo8jrIZnX1?=
 =?us-ascii?Q?W4r0fGvQm6vRVWSMKIDUOUIyNXPbbUOtWOEBe0nWiA6wCVcpOjLwlc2Xj2YQ?=
 =?us-ascii?Q?MVutqfIlEWhmn1UN/1nX8I1zYCibgOnJ4ZSqxFGhFAYitUIAuJvE1cCUIMe7?=
 =?us-ascii?Q?MqMfepnB7BEzc7l9Nn9vx70tN6IADJnsawfP0APvSVPJusoG+b9Sg3GCHNwB?=
 =?us-ascii?Q?rKSBJ4sEvt3g1M1krhY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 14:50:05.8068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26fca080-1ede-46d0-d927-08de46e98e2f
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR22MB3662

Description
-----------
Add the possibility for the user to allow the configuration of watchdog
in low power mode.

Testing
-------
It was verified on a i.MX7D based system that once enabled the watchdog
will reset the device when the system enter in low power mode.

Nandor Han (2):
  watchdog: imx2_wdt: Allow to continue in low power mode
  dt-bindings: watchdog: fsl-imx: document continue in low power mode

 .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml          | 6 ++++++
 drivers/watchdog/imx2_wdt.c                                | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.39.5


