Return-Path: <linux-watchdog+bounces-3022-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A637CA47BEB
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Feb 2025 12:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD5763A3DE3
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Feb 2025 11:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A1B022F164;
	Thu, 27 Feb 2025 11:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="EgcoGntc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-m15574.qiye.163.com (mail-m15574.qiye.163.com [101.71.155.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C5122D4EC;
	Thu, 27 Feb 2025 11:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740655181; cv=none; b=lTCjsRm9Ey36+Jxee5bMDoJ0bF1JxFfY0oSJQzZWzFzu1Yh9AXPeJg0qFa9khJjs2TptTw0djKrt4o23ySoK3hhR4iE1FMn4mMzDa31KpSbTAmvsuDHs0HfUsaYOr9uRpAo6ldhHKAmTdD7hKd4dBcMZyqWJo0DUaH8JNbuTe3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740655181; c=relaxed/simple;
	bh=8nxVAn0y+muDhbzVRlwphXg3OiK0MuvkEFK9HHV+OP4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I7RI8ew9fVnzMRsAdodJph/kaa01d8WkEudCvaAKDBgAZHc5aTseBJ6RFd6C3OGW/CwE0olGiv+36zfTO3q/3ivHkauH5aSFTM881R1MuUQZ6L8Lr9uniQ4lb2aOdnoZRobXw0jmJ2CSmm0wKyk8TaGwIhNDYzA1F7iroaHlykA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=EgcoGntc; arc=none smtp.client-ip=101.71.155.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id c65f97df;
	Thu, 27 Feb 2025 19:19:29 +0800 (GMT+08:00)
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
Subject: [PATCH v3 06/15] dt-bindings: watchdog: Add rk3562 compatible
Date: Thu, 27 Feb 2025 19:19:04 +0800
Message-Id: <20250227111913.2344207-7-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227111913.2344207-1-kever.yang@rock-chips.com>
References: <20250227111913.2344207-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUtIHlZCHhgZSBhIH0MfTBhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEtLTE
	5VSktLVUtZBg++
X-HM-Tid: 0a9547220f0b03afkunmc65f97df
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORA6Kzo4FzIWDQ0TAkMvHkgh
	Fg9PCR1VSlVKTE9LTU5OSkxLTExCVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFCSEw3Bg++
DKIM-Signature:a=rsa-sha256;
	b=EgcoGntciTxCQjGQDNSXhBebTn/a1XHkwoVLEKby7uIjYhLPIS0qshS/xaWEf1NaIlfHns0hGP4E0KlxakFCKIohef0rDdIihujpLnnoSGewgHlVmsNutRNp6TcG6EbTFbSlRl4Siql9xAbRC1Tkaug9NHo2yQph2kGJ16Sa8Ns=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=MmoOb1kC/SCzMgR6n1gfFcymCz5QC60HQW0OqyXl4dg=;
	h=date:mime-version:subject:message-id:from;

Add rockchip,rk3562-wdt for rk3562.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

Changes in v3:
- Collect reveiw tag

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


