Return-Path: <linux-watchdog+bounces-2611-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 099DC9FBBA9
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Dec 2024 10:56:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 914237A1275
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Dec 2024 09:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB681A8F98;
	Tue, 24 Dec 2024 09:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="kIsQGord"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-m1973170.qiye.163.com (mail-m1973170.qiye.163.com [220.197.31.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED5517C220;
	Tue, 24 Dec 2024 09:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735034088; cv=none; b=n3fafa/OI67+B81mkWd31W34+IMZteeNTDpwZDL9CSGalF71VWEjLgjWKS9LxZE7c+es4m0vsvUOrb0kiwfhUo8xWmMW4a8GksRHum4vyaZWXlxuaeHUkmxX7ipN7GTKQr690tLSHUEM8H7t4dba3hFgNBsQxswGKOpP36AzhOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735034088; c=relaxed/simple;
	bh=QC8QKO926aubblv/IQQskodaCWChRpxnYNf+iiZ2nS0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A8kYc0RGgrImvd8XxEAV37iXExhbto7wNwhTNeEG6S/ESqRbGWkdyTMAnFtR5ThcYCBt/IG8NByKLHlbbmib2riYEqwNRbgzYNQOxJgdYkY96wYMmNMHsCa5oUA4ALmqAMKPPBCgVwUhcYhJYeOH16YziUAgdiJC0eTWnr0+Gjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=kIsQGord; arc=none smtp.client-ip=220.197.31.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6aad4f15;
	Tue, 24 Dec 2024 17:49:33 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Jamie Iles <jamie@jamieiles.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 07/17] dt-bindings: watchdog: Add rk3562 compatible
Date: Tue, 24 Dec 2024 17:49:10 +0800
Message-Id: <20241224094920.3821861-8-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241224094920.3821861-1-kever.yang@rock-chips.com>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkNKHlZOSx1LHxpDQh4dSU1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	5VSktLVUpCS0tZBg++
X-HM-Tid: 0a93f8125ef503afkunm6aad4f15
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRQ6UQw4CDIXPko3PFELLBkM
	TTdPCRJVSlVKTEhOS0hITExOS01DVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFDTks3Bg++
DKIM-Signature:a=rsa-sha256;
	b=kIsQGord8lsAPJmwszbIVhJI3b+HHzCIMLWAf6rQyq5DWGDccoC0RNicvEadQy8GW9w+qIhrB3ksI/idOd777KwoiVRBxb2wN2N7piZj48fEqpN1fnjTsXApCGlkc4Qbvlb1DA5JH0xzzW2OkxQmaO4Y5PNvM2s9NsSBlKPAIAg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=w65nHanWmBSK+gAUJK97FwbkvqytD7kBrCEuPTUVJpI=;
	h=date:mime-version:subject:message-id:from;

Add rockchip,rk3562-wdt for rk3562.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v2: None

 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
index 1efefd741c06..ef088e0f6917 100644
--- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
@@ -28,6 +28,7 @@ properties:
               - rockchip,rk3328-wdt
               - rockchip,rk3368-wdt
               - rockchip,rk3399-wdt
+              - rockchip,rk3562-wdt
               - rockchip,rk3568-wdt
               - rockchip,rk3576-wdt
               - rockchip,rk3588-wdt
-- 
2.25.1


