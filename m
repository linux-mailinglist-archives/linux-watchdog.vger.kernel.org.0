Return-Path: <linux-watchdog+bounces-3744-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE46AAEB32E
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 11:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A28CB1C2100D
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jun 2025 09:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00CD8293C7E;
	Fri, 27 Jun 2025 09:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="U57TunGZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5039425F78A;
	Fri, 27 Jun 2025 09:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751017484; cv=none; b=ni1pBn9dxCm4cp+I2JtKB3G6+RSM6IYJa5eSwtr6TjuM5Nttf/bkTWd+/YNImSiv78ZOKqUZQ48I7dZCa0e8Dv8wz1qNZzOKRfzmsatsHDCt0IyTvBfeKy2tYBr6OLP67pho2CZXLITkQRIUqf/MMMeCEYgaCUIa8YRflfcXg7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751017484; c=relaxed/simple;
	bh=M9WdmJkU6298jjaKINzNf+tAkCNpglCxAoM6CXnDBXQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KaeluUQX8eV0ke+rWG3nK4Gh0mJlajXoHMMZ8d/gl62T4Sg82slucHdvZRyirfE/qkdEPj8DtNz5hk/vbqIcpI2fD5/d0/7HA3MF6xiGFpJrwK9nCUlrbqMWV65pMdVQKD6QSlr3KlRUD1ZgH4ziSO+x5YPyL19DqcZCTrN6SO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=U57TunGZ; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 55df660c533b11f0b1510d84776b8c0b-20250627
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jreIx6PtT6w4BeFa0dDuav4vW2DugASqzYf5r6DK060=;
	b=U57TunGZD5Y2k+AvAiTKcyNyrC/krbuxptVD+XTIEfT5iFEcIe7Z74u4kP7o8Fo9F2kD/KQF4QID5rIHJxDF/Tf/FMkP7O5q89iiLmYRw3sw08i0b9nuznB+T/L0pJgplDg8W4jC6zg7602ERUi8aQNqdZUhFAsacuFxtYN9mkk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:0b1a884d-3726-476d-8e13-12f8eecb81ee,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:9dda4482-cc21-4267-87cf-e75829fa6365,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 55df660c533b11f0b1510d84776b8c0b-20250627
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ot_zexin.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 199619063; Fri, 27 Jun 2025 17:44:35 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 27 Jun 2025 17:44:32 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 27 Jun 2025 17:44:32 +0800
From: Zexin Wang <ot_zexin.wang@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Zexin Wang <ot_zexin.wang@mediatek.com>
Subject: [PATCH 0/2] watchdog: mediatek: Add compatible for MT8189
Date: Fri, 27 Jun 2025 17:44:18 +0800
Message-ID: <20250627094431.11772-1-ot_zexin.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch series introduces support for the MT8189 watchdog driver
by add compatible.

Zexin Wang (2):
  watchdog: mediatek: Add compatible for MT8189
  dt-bindings: watchdog: mediatek: Add support for MT8189

 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 drivers/watchdog/mtk_wdt.c                                       | 1 +
 2 files changed, 2 insertions(+)

-- 
2.45.2


