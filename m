Return-Path: <linux-watchdog+bounces-1332-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5972E92B286
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2024 10:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EF4A1C22381
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2024 08:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC410146D6D;
	Tue,  9 Jul 2024 08:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5TRH+9P"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9736138;
	Tue,  9 Jul 2024 08:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720514908; cv=none; b=alSbP6UTTwg/5sz1nM9DRYDoGLgGgej/tY9ukQ6ZBcUmIgxV4nIzkd8fmeEXFTf7cfMZ2tHQYDBf0+PuiRWbqPT0cbEJvs/dSonrJDXWA4Y4cGLtc3B6RV6gBaeIIJMZfC0KaQph3L4eyOOEH2z1ruaZq7UyHaqRlNxHGoNNk7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720514908; c=relaxed/simple;
	bh=KvArodGPL+YHrSkE1lZP9hFA44qMNK93x2WhNXz/zLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iikh4BTFSzR50sSS4eRcYYApVdVXdXwYuO9CBJ4Gv7kfcjKgXzuGz/OTJ4BhlBqmnHhj4Z+NAk0sfxLR6owOjJisGadl3P/7+beYzMsxmjlUvPOxGf7mvfeFqNIdkA5MtriovEY+uC7CS7YstGhHRkHTt7QtMcB6irhdnMqG8WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K5TRH+9P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72A33C4AF0A;
	Tue,  9 Jul 2024 08:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720514908;
	bh=KvArodGPL+YHrSkE1lZP9hFA44qMNK93x2WhNXz/zLY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=K5TRH+9PBMepS+J+vzgaz4MzaGR3GmCixlliAwq/c/5gcS6zi6y1aqiUckixT+RX9
	 6CY0slaihb7EVqZ2AijpH+w4+o4g2D9EJlUQmxP+JjtcO8wdj1s15/ThwWxVL1Os4o
	 q028vOM8duPAHjy2mk5Ypq7HkrEIHx69C6OPJM/7zvRqzpNibhIALPsUrH7CGuUnSd
	 Fa/AS2tC9UtkFYT04zJmLlVSRSC0JWgFWA/17wGJMbvlW7XVkmPL7oU94rbncOBjdk
	 SUt33iKpu5lDMLKkAdTWRfZ4PqY5QrXD+quLAsswA2tVqWX3pQ7+Z+FoEPYafeBTSq
	 ONC3AOJrQkVWA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63238C2BD09;
	Tue,  9 Jul 2024 08:48:28 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 09 Jul 2024 16:48:25 +0800
Subject: [PATCH 1/2] dt-bindings: watchdog: add support for Amlogic A4 SoCs
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-a4-a5_watchdog-v1-1-2ae852e05ec2@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720514906; l=894;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=WSePT+XFO2cODMzffP2GQB75+cxcIunyp22iaEGOG9k=;
 b=/GnnQaw8grZyQF6/wV6MN5no6SKlMc27aNZXcXDnmTwLzDJ7SnyUU0p+7MFhekaNcJ6jZ0tkn
 +wRy6wjmoNDBQPJgq4mp00r+Ylgm11XR0Q+UudFI1wbZOVdHaLJmOnN
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Huqiang Qin <huqiang.qin@amlogic.com>

Update dt-binding document for watchdog of Amlogic A4 SoCs.

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
index 69845ec32e81..d0eff1ea52b4 100644
--- a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
@@ -21,6 +21,7 @@ properties:
           - amlogic,t7-wdt
       - items:
           - enum:
+              - amlogic,a4-wdt
               - amlogic,c3-wdt
               - amlogic,s4-wdt
           - const: amlogic,t7-wdt

-- 
2.37.1



