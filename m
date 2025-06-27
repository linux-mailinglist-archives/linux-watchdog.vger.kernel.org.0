Return-Path: <linux-watchdog+bounces-3746-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16207AEB332
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 11:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 882BD1C2111A
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 09:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C832980BF;
	Fri, 27 Jun 2025 09:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pydXQx/3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3339B295D87;
	Fri, 27 Jun 2025 09:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751017488; cv=none; b=iJ27LHqkjLp10CBt/8hAVhX6sWFcZjmGtJYKWEAymEmnsa20vZAh98Sz4XdReNXWG7qlN+G/swRYmduB1opLEf6Vgw5atYWJjgzKa/C7pvIrXZXBro3VrmqOBKiYJ4lCkxiQdhygyX9I62gDMr48dP0rjbrnWLYPYDjnRNR133E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751017488; c=relaxed/simple;
	bh=cR0BC0WqHMG5QDCzo0K8PjXovh5T5DCmHy14MHo7iL0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DAh3W7umFFILQDZO0DH5QL4aN+xzXDvbI53SU5Cso6+3kwj/7tz9WWPKJ5wXWhUsa4r50KZDHRVqIXR6VkAKpPQpIK812xCFNQ+0fAWIrYA91ldJ5dFRLC99BvtDTj0KDNUecIk3c00CKeiO5PqVsQ/cgjpx0W4RrtyicNRZRFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=pydXQx/3; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 580636fe533b11f0b33aeb1e7f16c2b6-20250627
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=flv9F+vbWlUEP0g6n2CeOJYKmBHG5x2fJ3VddYBRjUw=;
	b=pydXQx/3azrSwPMA9XAY3IQSCd2ln8X5QqwNAoj7WCipsZF/5N3N04+iM4ALbvYjxOTmvY2FGXttUWk8TGkMYEbBB4Njw+YIeblSyH2crOsTmuZlOu0vYXMofl6LlBveugOw2Gi/TxibqnRoIpQ4oLRDxZmUbDBEHZrnII9MJ5Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:b110124d-2bc0-4bee-9700-70e000e04ae7,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:842ea114-6a0e-4a76-950f-481909c914a4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 580636fe533b11f0b33aeb1e7f16c2b6-20250627
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <ot_zexin.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 699263590; Fri, 27 Jun 2025 17:44:39 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 27 Jun 2025 17:44:36 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 27 Jun 2025 17:44:35 +0800
From: Zexin Wang <ot_zexin.wang@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Zexin Wang <ot_zexin.wang@mediatek.com>
Subject: [PATCH 2/2] dt-bindings: watchdog: mediatek: Add support for MT8189
Date: Fri, 27 Jun 2025 17:44:20 +0800
Message-ID: <20250627094431.11772-3-ot_zexin.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250627094431.11772-1-ot_zexin.wang@mediatek.com>
References: <20250627094431.11772-1-ot_zexin.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add compatible string for watchdog on MT8189 SoC.

Signed-off-by: Zexin Wang <ot_zexin.wang@mediatek.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 8d2520241e37..ad69bd28ac9e 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -29,6 +29,7 @@ properties:
           - mediatek,mt8183-wdt
           - mediatek,mt8186-wdt
           - mediatek,mt8188-wdt
+          - mediatek,mt8189-wdt
           - mediatek,mt8192-wdt
           - mediatek,mt8195-wdt
       - items:
-- 
2.45.2


