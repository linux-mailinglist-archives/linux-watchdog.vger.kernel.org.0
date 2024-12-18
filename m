Return-Path: <linux-watchdog+bounces-2590-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 585329F5B8C
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Dec 2024 01:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3D0F1893D8A
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Dec 2024 00:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE953597B;
	Wed, 18 Dec 2024 00:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AglZ4gEV"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F78C22F11;
	Wed, 18 Dec 2024 00:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734482064; cv=none; b=SekH/vSBnlomQdcqZlc6/2mkzQIIZvnNesBq77W11CFBfLjHplVB2CljEMi6RwjWhQNSm1gkMfSbRwaiUpO4xuRt1mFsbAgO2gnL7RC7lVRefSjkW5f34fUnaqE8IRn0mQc9CKHtKApVawTC6e/GISfq+XNjbYi7sxJYMx9+lss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734482064; c=relaxed/simple;
	bh=J0lN12o42Ts/XZ00sr2mUAvNLYFZDTiOMmSAXS4l/+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EjuBPEKoReCNnF+HBz3Fwd7PTsQofvo5cNfgz7EJ+QpUgV7Vm5aDvpjy4NksxXpN2umYtGDfl8/Spz0dP7bLyhmq/uaf6vQRhwAKLWMujFMZILCwF5BwFutX5UpfWiZpijWCbHP/tsKNQkLoayJRlt9kozYMupFdqUd11QQgNWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AglZ4gEV; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385dece873cso2771351f8f.0;
        Tue, 17 Dec 2024 16:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734482061; x=1735086861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPsSY/vDTIBVJbWj/v2GMfspPaU8bYuXGnGAc+jp9Us=;
        b=AglZ4gEVnCQeHkGv6VLc2x76EnWxKUUxH5rgPvtGifUYgHjZnenioW9mBouXIzsIRS
         izpFPOM9sLHa7pwq/d6q/dlihwYCiO8uxvPecZr2JOt5Yst23I5T2VNcnKc0SbAKnM0B
         2LwRYOHTe4gJZQX+jE9cYESQayDMnzVgdh7rq3/VhT02CB+aKnfpWH7tzu+iNUfbaQ35
         5Z5lXDKJU+66sbeL7KhL3wXvlsPD5zFBhuNouBil2ODa1DImdR/qK/xKi/YvLUfUmqNo
         XtF+4ydgfzT2cp1zaptX5u52z2+tOSJUaLp/TXvtKowrZxptetzrezTIL2ZmlxfusihP
         oKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734482061; x=1735086861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPsSY/vDTIBVJbWj/v2GMfspPaU8bYuXGnGAc+jp9Us=;
        b=NP9ZR/3NtbGvurgoK6/BsGtkPXI58hybSDUIlIrQF4rsMbbtqXhNybWjpYlWdn05Fg
         EGE34jt9sHkC0iOfp5kIP7k4DAHH5mr+hvjC5wBfKfvdS1w3LmlyObnQ6184XICTj2iz
         66An4H91Z/eY2ZMJt5K7siImVuxIw+zhHAOKtFnvgLJ1/bcz47vsKxHQWsyWN2lF//Q2
         fn8l4MyXsG+YMnkyWEHeAafMC5frj+AMQLLc6FXXCJ8loywWnvFWQQohdw/S8IDclQ0P
         5m2QQAqB8ChJUi+7rd7Y7BK390y4kkorCGuXBJdum2OgxcugbP9Vs5UUUojkYIFUwKST
         4sWA==
X-Forwarded-Encrypted: i=1; AJvYcCU9P8xQDcBOBGQr0NmiAAT7h+fzbGg6+LLJW8fgBzL5QAwZAkELKbJ1JOrlUCLac9cVonpP0qktsCu/9za8Bqk=@vger.kernel.org, AJvYcCUFntdtw3gvVjUpm42LMPCk5OGXMTaMe8CfE+2YjdA+C1xKyb/AzIFfO9BlgM1l7yvf61dXgncFH9RZ@vger.kernel.org, AJvYcCWt9lHTp9KgRwanAFcx9FZbjy5x86WCEGqCTuEGx6BhhVQlcIoWkNfC9uDWA4cQKtey5ql4PZLaMe3L@vger.kernel.org, AJvYcCXlRKoZ8UQCAxqiwozVUGHpNsBuIpRVvB6nis1U/RKaybU/3ZcRboDNw9sn9DriG8CtSP9pNEUpYkbg3kNg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1CoMdOV89rn+iDRTwc/eiGrWbzO3VYXVZh02cv1mMIsmKCpVk
	nIoRF/rz4ecxS947kwf6U5VkAy62WZh+xwkI4PXnoDEz8FSnLSGw
X-Gm-Gg: ASbGnct6fE3VaZWhLBUjk3IIcQ7SKiOGXW7++DsghWiad/ghxesVkoJ4IhfwzScm698
	mY5+FZGwyTEI9zkzDlTxjeFxLwVaJcHCnDhVuJcYqdCfn224MVLagAuhg2SrW9XLHxN7NdnFsQ1
	fBAnREwG1gNv3bDXvelXlaUOCUSn62BjecRfXIAGBKtIXBNbsSMQssJEdVlx42XqQkojhaONdzQ
	3UyYvTxESO2qaF7B8xVj10VinzO6ocMKZ2c24KK6eN1dKsPNJHp8JABopYjgGJZyDJ/j/vNl4Rh
	wPCldlSvuw==
X-Google-Smtp-Source: AGHT+IEA0GZxPIv9R6wVCS/eOn0zksCUlvVblBDnJD1pkQ925GBD1cRznFzTY0qqMLlHeP3Vh7Qhyw==
X-Received: by 2002:a5d:6c63:0:b0:385:d7f9:f166 with SMTP id ffacd0b85a97d-388e4d424a7mr711677f8f.17.1734482060633;
        Tue, 17 Dec 2024 16:34:20 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:ca61:1d3a:8af0:1c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b287sm2365625e9.29.2024.12.17.16.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:34:20 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/6] arm64: dts: renesas: r9a09g057: Add `syscon` compatible for CPG node
Date: Wed, 18 Dec 2024 00:34:11 +0000
Message-ID: <20241218003414.490498-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218003414.490498-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218003414.490498-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add `syscon` compatible for CPG node to allow the IP blocks to interact
with the CPG registers as needed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index e39da64a32e9..69de6c302b17 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -243,7 +243,7 @@ pinctrl: pinctrl@10410000 {
 		};
 
 		cpg: clock-controller@10420000 {
-			compatible = "renesas,r9a09g057-cpg";
+			compatible = "renesas,r9a09g057-cpg", "syscon";
 			reg = <0 0x10420000 0 0x10000>;
 			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
 			clock-names = "audio_extal", "rtxin", "qextal";
-- 
2.43.0


