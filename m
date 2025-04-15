Return-Path: <linux-watchdog+bounces-3300-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC0AA89347
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Apr 2025 07:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BC863B585F
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Apr 2025 05:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F98218AB3;
	Tue, 15 Apr 2025 05:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="DeKfQe4a"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-m3270.qiye.163.com (mail-m3270.qiye.163.com [220.197.32.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731CE16F8E5;
	Tue, 15 Apr 2025 05:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744694358; cv=none; b=c9ozNmhC9gvRn10oRV+5vZu5W0GJ8fZcRF/giROlqh2xunY9SefFaoCIaw8Hgkp0tB+vfMLFxSLY51N+mY377qx1YMSZjhkYYUHHRirH1AUtPbAxmZX3MWcB2cvS3SjZ3shFYXDHkUzKW7RWz9xY+ax2DS7YIH6xIYg0D9AsTcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744694358; c=relaxed/simple;
	bh=mWtFDZHg1r6y6IMhySi6lDa3p+snqjjOO/IWo3q8Ecs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TaFyUJChnmt3hrQd6cxh+qmwlb6k/0jHFI+rZPadGshCLiCF64j4YG+X744WbNfXP0gASo55iB9OncVKbR2cZ1a+OmJ6NUH9S3YM0/LI/BbDLm9dqx14/ndgXTzt3xjnNhILjA93FEnVNzk7BBHCb7lEqGTVAihJe4vg0N77v4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=DeKfQe4a; arc=none smtp.client-ip=220.197.32.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11e6d9666;
	Tue, 15 Apr 2025 13:19:04 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Jamie Iles <jamie@jamieiles.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 2/7] dt-bindings: watchdog: Add rk3562 compatible
Date: Tue, 15 Apr 2025 13:18:50 +0800
Message-Id: <20250415051855.59740-3-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250415051855.59740-1-kever.yang@rock-chips.com>
References: <20250415051855.59740-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGElPVk1OTB5KSE1LTRpIHlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a9637e2fc9103afkunm11e6d9666
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MVE6Dyo6EjIDMBpNMAI1CiwU
	MUMaCglVSlVKTE9PTUJPSE9NTUtNVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUpCSk83Bg++
DKIM-Signature:a=rsa-sha256;
	b=DeKfQe4abJYf/699x0pibc25o0A+rCvVmakoIFs2jIM3Lo6KubZg84KUwTd287CGyb8BUARqI50BhExwO/ZQz0u7LTwQCBXXNTyvfzO2IF/QcfABhNKREB/nPky5JUHOWcp+85NcKrVBxnXa78S4seuodXvv5sJP1TyRFc67Qkc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=7zvcR52nxAfj89Os2WEfFymiMRRilSIUxY8AcMkjvVI=;
	h=date:mime-version:subject:message-id:from;

Add rockchip,rk3562-wdt for rk3562.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---

Changes in v4:
- Collect ack tag

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


