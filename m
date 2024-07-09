Return-Path: <linux-watchdog+bounces-1334-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6497C92B28A
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2024 10:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96C4F1C22381
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2024 08:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28EF9153509;
	Tue,  9 Jul 2024 08:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ftdi3ct6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBC114A4E2;
	Tue,  9 Jul 2024 08:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720514909; cv=none; b=edAHVV002yhMDVt6Gc5buv027jSYf+iOQC4eL3u7wPkngE0AgQ+PHCiuPsS/HT3jJE8QJy9WYvh+7CzwmLwx/rCHAtIKTuu93OwuQLYQRj/UL2XHDGWRsJG7mwQiR6pJme9dZACs8dPSVZ6z9LS9bOC+gZIVlrHKhh8vM06W8as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720514909; c=relaxed/simple;
	bh=ypxnfVb7P7V/FsyomfgbJUvYWlUFeNq86VhHvHpwm+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W9DwTiQjjtPDq/FtDeso6GdDKoJepC5yQXguPbwOR4vXXBMGZkh4WuLiB9WKzmKUbt+x1lef4p8XN4/tyswzJCrmqOaUVo5ItHmus6TFHxlbQth3ig5okJcqQXKTBBehujX0ZgDT7e8keRXxIDo8iVx6XwClxJg8fc1MxzmFH+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ftdi3ct6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81CEEC4AF0B;
	Tue,  9 Jul 2024 08:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720514908;
	bh=ypxnfVb7P7V/FsyomfgbJUvYWlUFeNq86VhHvHpwm+g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Ftdi3ct60Z2E00+8/BRUNyMKO/RV4dg4euUqGXrRzXuZU0i04NX3O7D5YotxotHeM
	 jn2y/ToFNIwUHxz0t8M5IbzMWuzh85bu9kRig4+CxMWT7lE3JLVzSax6zEStjbP2+t
	 w8pjux9TBOLhpfELuU+etls3RHzr+iPKiu3RNpJsWBxXkjYfhNil/yUPFt0XVTGo5O
	 JOmE1kE3nKSbGMkk/Go8LK+IeBLXek8t8FfL0AG4yrXEOdrC5MLgmTpD9fDHPJsW67
	 rbQHmJyfNeXzlvISrIDcb6dWbS/PCzUi7W4b8wu8LhD5SpP97us3EZcSbQhNbQvKZ9
	 x0Po254Ztf5oA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEEAC3DA49;
	Tue,  9 Jul 2024 08:48:28 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 09 Jul 2024 16:48:26 +0800
Subject: [PATCH 2/2] arm64: dts: amlogic: add watchdog node for A4 SoCs
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-a4-a5_watchdog-v1-2-2ae852e05ec2@amlogic.com>
References: <20240709-a4-a5_watchdog-v1-0-2ae852e05ec2@amlogic.com>
In-Reply-To: <20240709-a4-a5_watchdog-v1-0-2ae852e05ec2@amlogic.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Huqiang Qin <huqiang.qin@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720514906; l=898;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=nyw71UzO4OzW4LTj0eCc11shu2eqR6ZaJjbu/OQDEDw=;
 b=aWsB85jIFB9Rl+qfZ2QeulNuT3GyzoAIAwWkmfKJSU6pREfcaqDIpxneE0SWsaIe5hqCLoI4c
 ghCrFuV6L19D3mI+ykUXubGTygUq6G/+UPj0x0Knm417uxSwB/7xUJx
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Huqiang Qin <huqiang.qin@amlogic.com>

Add watchdog device.

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
index b6106ad4a072..496c3a2bcf25 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
@@ -52,6 +52,12 @@ apb: bus@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			watchdog@2100 {
+				compatible = "amlogic,a4-wdt", "amlogic,t7-wdt";
+				reg = <0x0 0x2100 0x0 0x10>;
+				clocks = <&xtal>;
+			};
+
 			uart_b: serial@7a000 {
 				compatible = "amlogic,a4-uart",
 					     "amlogic,meson-s4-uart";

-- 
2.37.1



