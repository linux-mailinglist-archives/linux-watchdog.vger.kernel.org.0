Return-Path: <linux-watchdog+bounces-3833-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E809AFBC2C
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 22:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 832C54A1508
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 20:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D57264F81;
	Mon,  7 Jul 2025 20:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+kzxn50"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEE9219A9E;
	Mon,  7 Jul 2025 20:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751918486; cv=none; b=E0daLg5pfKJxDrO4Nqo4WC4B+7GUBK04yiwIQ7h65+BnKg4zH++g+vZmSOiIHAAJxX3wJW1BQYgpL7unv6RzIoIfo7rJsOybQqKg/+eSEhIS8LaRoVYNcQiCMqWBFxVj2GaRxh6x9SmrT0gkQKV9qtdlP3BiTRExWowXIw3AlrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751918486; c=relaxed/simple;
	bh=a9gV4/x5WR7owAGGWjd2L3oOQiFwyR+RxwADdjljzdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lThY8X32u5EOz4yMqBn72Z8CGfShJwOY+ZzxGibVpYXhitxjcAIpRbwEoPu8ItxhMMlqvBfb02CSOIM+exuBjPvDob1qLSbMwQffWTLXKC8w8IMpaytXXoutzoriRvViSoUFopvbAh4m/SX/0uHY+TWzsGOHcdwFEYVe2FyPduo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+kzxn50; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a5257748e1so2958053f8f.2;
        Mon, 07 Jul 2025 13:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751918483; x=1752523283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msAgLL0y2lo6QCVAd1jQcAowaRieaZMHAfnPdkFo6ro=;
        b=H+kzxn50O1QGK7Ia6zSBcuCo0QyAzP3lExLCDYsTussQPgQr0sn/L810dJTum1VTXW
         c1EuodkOz7UGXf7ebNsVHcPtiE35dnMxwZNvQwbrlHq6Az8kSbpEF/nz7sLtoEjn5zQ2
         dizJ6AFsElytO7SQyOfbs1tu9PQIhQyqnC1YrLriTE6MjfzGiqloUdyCchON4wz1SUpH
         K3IMxz+fQDzGqHvWXemQjIkkjfY/qCJ9VfxTWtJZbOm6YJCEJMjFMGKzsLcIXPidUtfP
         hkGykxjG1DsmOPDKJn5NzoV+i3uFP+QhByorSUMwTwthHZhPI85Il/Zm2POXYuns4doy
         P1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751918483; x=1752523283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msAgLL0y2lo6QCVAd1jQcAowaRieaZMHAfnPdkFo6ro=;
        b=EAUhhjJ8TF93PUx3PEKAxHYbPoN1PCnTcR9qcNJru/Hd0F//WO9c6/6vUpfROqC2Vt
         S08xBhRvVMTW/JgUR4Itz2T9mXiQEllu8Ba9jnybpqbtR86A5PMf2ffYsKF4d8xCfRfN
         O2RIfV+TZaZqspihGw80PJtpMXCi1pU+jtPNIMYMLrAtCsiPeULPZl4Xls1+6qI5AfrE
         x7/qKM3XyRXkU8E4lGffv828fWjtBEWkb83SUpD3GMDzxbmfSMcESYqEyHO/gM9dVsiL
         ZFkrIjVNgMKJE479dv7g3lFb0shS6dQUpV7FVJL7+qkbkZCFuNkcXb3GHs7B+AtZqn7D
         oDZg==
X-Forwarded-Encrypted: i=1; AJvYcCUSIcnl0Czgu5311l/vPBzxXEC7C1WlxSnH5CeGs+STS5WWgfXckYrKubHIXMjj202SOGG5yyjWHEsyf4g=@vger.kernel.org, AJvYcCVeO9qT04Rbb2YEUzTgk4vqoBXssRgUKqsFHAiNM4iWers3UM+EupnxHvsnGWEUjPUadk7h4TiZfRqhgJpbrYPJuGk=@vger.kernel.org, AJvYcCWYA+ZQP5bTeV0uk+TcLJeGkPbVawNfXG/zM7zct4Wcqgsmw0O7wvkF4NJPu5BGtGLCXNDJRrgE+K0bjz26ANo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaI2lJ+UdganCaQXCtM8ZhTLM8KXYZ/Ka3KJBIjXdnQZ3M0Kz8
	k6rCVAjM/P1zjkqariG2vFZxQRKOKD17h/FZVT5wn4SrvkJxbnx9eSpn
X-Gm-Gg: ASbGncvlIpIvwoEFxpbSa9fC1zSbqUivv0N9Rr+PbV1MjszRXUDLrCdp1tW6+eLlWQM
	rrmrFIhgwg3C4By0frAsrMYcF9acu4VJSGOn2R1gH3SGJZIev4ylBnG9Ut+RubRBGtQY9XzK+NO
	rvV9/OU15fADT47y+pWcVHmqGqB4ahO2StWwRVBHBAvYVMY4qo+miMd0/PXqtWrpiiLiSld/Zu+
	IDmXvRZm9goWNe5H8L10T6liYxWZgdg7J3k60pwl4qck0EfkDbRxyaLKxsroVBVOvSzCWmiUnfX
	B06rGbx8kbqIbUybEAcsI88/0eWHgektBBFE3xwciL3ShTR/EZPHKy+Mx+19Pi8UE++x1jQqDtJ
	fEXYLXISA3r/XN3Fwaqo=
X-Google-Smtp-Source: AGHT+IELYB5O/cKYUGRln/ShcDYmm0RWIjhL2uNzE0qqkD5+GYtqnTZTI0Fz1UPcATF1Rlf9Pfy/rA==
X-Received: by 2002:a5d:5d0e:0:b0:3a4:f35b:d016 with SMTP id ffacd0b85a97d-3b497011a15mr11623488f8f.11.1751918482935;
        Mon, 07 Jul 2025 13:01:22 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:d418:e5eb:1bc:30dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b97376sm11268995f8f.61.2025.07.07.13.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 13:01:22 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-watchdog@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 6/9] watchdog: rzv2h_wdt: Make reset controller optional
Date: Mon,  7 Jul 2025 21:01:08 +0100
Message-ID: <20250707200111.329663-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707200111.329663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250707200111.329663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use devm_reset_control_get_optional_exclusive() instead of
devm_reset_control_get_exclusive() to allow the driver to operate
on platforms where a reset controller is not present.

This change is in preparation for supporting the RZ/T2H SoC, which
does not have reset.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/watchdog/rzv2h_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index cb584ac5860f..f0e2bf786acc 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -240,7 +240,7 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->oscclk))
 		return dev_err_probe(dev, PTR_ERR(priv->oscclk), "no oscclk");
 
-	priv->rstc = devm_reset_control_get_exclusive(dev, NULL);
+	priv->rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(priv->rstc))
 		return dev_err_probe(dev, PTR_ERR(priv->rstc),
 				     "failed to get cpg reset");
-- 
2.49.0


