Return-Path: <linux-watchdog+bounces-1333-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F7392B287
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2024 10:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCDEF1F22C11
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2024 08:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110791527AF;
	Tue,  9 Jul 2024 08:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fsw5n2+c"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79852AF18;
	Tue,  9 Jul 2024 08:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720514909; cv=none; b=FtYKz90ZF4tjpxVvG0EumdUr04xqCdRVtKgv+Rxv9LJvZeCj6wL6Vo6WQ5UpTJMOskFQ+ud1WrMk9uofE+/aaIkMTBGex5fKxYwSUrOAtJd8xzhfwYb6bb9512WQQZgntX4d7Y0vSvmmUeFL9N2X0RJnNbhVHRQTAdnnj5GqudY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720514909; c=relaxed/simple;
	bh=7xFWmZqAPbwyctuy8n9YTTEtQ0XcaDLndPTpjsgRAmo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KojYcG9VPrcyADaJLn8wEjpjXJwakfmvOSh5NB64WPGy+L0UcT6PxpCRAWwU3376kIzlVLV7W5kwSeY7S+gtHgk62PgL7jZGIXbXSUoANxCIq46r7RYB7LJEOvCV4ZyxJXZhffwHOYhK4eL+hxVFUikvplVOR6CdL4P/xsxOg3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fsw5n2+c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 647AAC3277B;
	Tue,  9 Jul 2024 08:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720514908;
	bh=7xFWmZqAPbwyctuy8n9YTTEtQ0XcaDLndPTpjsgRAmo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fsw5n2+cgbOJwHCO9O0LChToWDSnmiexSSrfTlCowlnGCL/KCF88GSG6pkbmAsgsb
	 DbUDtiVKARGWxWZ20DVgF/paxqI2L+JksDvsX7povhSoO0NS+QYvpAKS0gpwhiyYGA
	 VszWkZO+sZhI7ZWavfiSJ800pH0XoSvMx5GKj8FXNmWUZtupwfObo/NVWw7BG1hMH7
	 fs3D8lbwxV1gdTYzA+hmSYy5XnpMDkkp8bpM1Ikn24LWMpZaDHcKV4qStFirkRSJ65
	 tyilWCcoIvVDG4jMYD0jZ7zGLftIMvjhmd2ovVSkRW74ZJkp06vmHfkreFzN1pnRU2
	 6cTaPIjepLziA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D01C3DA41;
	Tue,  9 Jul 2024 08:48:28 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/2] Watchdog: support for Amlogic SoC A4/A5
Date: Tue, 09 Jul 2024 16:48:24 +0800
Message-Id: <20240709-a4-a5_watchdog-v1-0-2ae852e05ec2@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFj5jGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcwNL3UQT3UTT+PLEkuSMlPx0XeNkCxPDpKRU8yRDMyWgpoKi1LTMCrC
 B0bG1tQCGKsOqYAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720514906; l=641;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=7xFWmZqAPbwyctuy8n9YTTEtQ0XcaDLndPTpjsgRAmo=;
 b=bGg4Jsddpfot2LQfW1JXBFEn1k0C3vVF6gJD+SLpLPT8OdvLjTJ1uEeHADGXVrplXYvbcQMaJ
 7+HMC6RuKKKBx+uBAp0e/2t85lsGv0ukBn6d25g+ug2ZhZy2D8WIg0X
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

Add watchdog for Amlogic A4/A5 SoC. 
A5's watchdog is the same as A4's.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Huqiang Qin (2):
      dt-bindings: watchdog: add support for Amlogic A4 SoCs
      arm64: dts: amlogic: add watchdog node for A4 SoCs

 .../devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml        | 1 +
 arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi                  | 6 ++++++
 2 files changed, 7 insertions(+)
---
base-commit: 338c92a5d1956f1841f84b86923087676d1d0cea
change-id: 20240709-a4-a5_watchdog-3c841bbe7b16

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



