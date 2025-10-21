Return-Path: <linux-watchdog+bounces-4410-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D492BF90E6
	for <lists+linux-watchdog@lfdr.de>; Wed, 22 Oct 2025 00:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF0AA58468F
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Oct 2025 22:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84272299950;
	Tue, 21 Oct 2025 22:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="uJccnVcU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D765426980F;
	Tue, 21 Oct 2025 22:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761086008; cv=none; b=RbOqB/8TzVv5u/2j4SjGCJv5+Q6Zurh0jjcbkxb5h5Vg0IkNmEdEu0BAUW5O1hocMgSxaE7V/u1rAkAKoTXTqN9Y1ISMs4s5v4Rj7rD84WMvrcWaN3Gwz7TbQBTV07MHfOBI5DQIN//sXfXWHJQ6hr+wocNJ8qDFM/BFBFHwdWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761086008; c=relaxed/simple;
	bh=RdF4C4zfYIMOuutMG05EeRkQa47z45nPm6Udszd7vhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BZfCYOYlO3tN0KREsyG/Hf0k8ik58XSG9lQVP7kJmVKn++UdgTJY/yUCY4z1/h8LwgBuwAJEXJe1fqysCCP/zm65kWDVaN9tG5SjsSGeDYBzHEodi9kW68/1oiPyotCWR79QKRhoUuXesznAfO31PjM2SD0ulIU+UEXsemh5/Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=uJccnVcU; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=ZCoka1jT4C6ihTpSLrU+pRABpnrzNQJSt1sW9jdikJc=; b=uJccnVcUirU4XfQWmMRDGrSklU
	j4NghMTQauqT/J5yxFt4+kptP57NF332BvxIySgI1XFPVDV2UpMHeNdBksxFMJZgKuktoTTEM/U/S
	3RPNnrzeBOVSo4nXAK63/3XouuNrvnnTQvk5FWC1iT+0CFdUNfL+Ljad1bj882dVSknRlecfRWOkK
	bdGZjyLla5SyaZjN7zQ0yEYXcvGv4qPxSwa9FCwL2K0emSyhRRO+Q55pliBpKnjfVzIwPgye2gLY3
	bC2c9+Tr+nIIASxVfdAvuUOqTJdPn74zLU+ODqTXsmiMIFqNM2NRaEU1AeSIFvV4J+ho2ERM/SjSU
	utwpJsvw==;
Received: from i53875b19.versanet.de ([83.135.91.25] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vBKuv-0006j8-6Z; Wed, 22 Oct 2025 00:33:21 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] dt-bindings: watchdog: Add RK3506 compatible
Date: Wed, 22 Oct 2025 00:33:08 +0200
Message-ID: <20251021223308.193700-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The watchdog used on the RK3506 is still the same snps,dw-wdt compatible
one that is in use since the RK3066 days, so add the RK3506 to the
variant list.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
index ef088e0f6917..609e98cdaaff 100644
--- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
@@ -28,6 +28,7 @@ properties:
               - rockchip,rk3328-wdt
               - rockchip,rk3368-wdt
               - rockchip,rk3399-wdt
+              - rockchip,rk3506-wdt
               - rockchip,rk3562-wdt
               - rockchip,rk3568-wdt
               - rockchip,rk3576-wdt
-- 
2.47.2


