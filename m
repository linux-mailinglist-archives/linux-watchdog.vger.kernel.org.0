Return-Path: <linux-watchdog+bounces-3834-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB55AFBC31
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 22:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A46F24A5D29
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Jul 2025 20:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08CAE267F53;
	Mon,  7 Jul 2025 20:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bb0lJNnL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E044262FCC;
	Mon,  7 Jul 2025 20:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751918487; cv=none; b=iK4Rce+5LI+2q7prZY6Ug5QxhExfsoQeZPB2/j2N4dnHobjP6TtulhRnSLZciasoQIfnsLVmN6WYjEToiEQF1WNV5nJwkVZDILEQjxnZDe5VjtMo+521bXpUK69RnRV7Gg3ZxauR6NqQB2WaZdcTYROcZ0uOqia+g26IVF7IGlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751918487; c=relaxed/simple;
	bh=qPF8NkTpUfftF7708X9YTMkZKg++XbeTAf2HLX5+1CY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oub0P79k9MJO9XqN0tDk3w8BiXSHXwd+L744OKfTvkH+bXMxUQpQug8IHCQflE8mhfvzyZjOl9bC4rt+1+smIhZSzXCUMX6ZUCSIYqgsw5byjYYjEahD++ROyiloAjhOEv0OfA0m02YIKr+9UW2xOgvnPFZPyBPx23arFa8HOvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bb0lJNnL; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a588da60dfso2401419f8f.1;
        Mon, 07 Jul 2025 13:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751918484; x=1752523284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7URniZWoEjaf+i2BnbaXXfBg+hacJuWnRqQYJeUW7ng=;
        b=bb0lJNnLAL2WwOP2s0KYSsWLIDrlIDcTmJDa/6a3GE7fCRuzCLIGRm84CHmistUc97
         npa2h7OpJrRlG7079EcsxYyGaPTm5lQLNv8yEhbLWjBz44NHYzEFPXmpSafZOuMaqxAx
         17He0AgZxds1bBIgIVCiD+Xyfo9JtHD06xA96fzsfy/XuJrhyRYf2BNQdsQ/xklu7W6W
         DsjPsRL2lk6tbcB+KRffE/ASB1t6z72MCT6WwpEbNqdh429LFGYgg1ovTfcv/Ef7XtzX
         g7cwrQ8nGA3k8MNpy7+xW04sCzQVvoK/3SmW0cfjyfgnV0I78FvIkv/kOU6kfmJ9IbAu
         6P0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751918484; x=1752523284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7URniZWoEjaf+i2BnbaXXfBg+hacJuWnRqQYJeUW7ng=;
        b=iA6ktSl7aXzbdCys6qtmP4e3Mx5wKYYWJCYalUJcPfqSRrtVSDNCbF5KT8x1Iassx4
         Bm6ghtquiEU/JBWnu3yws/D+Bc26n212Xshcz5TenqLW+8PeGObc33u3ubzFYflUYDW8
         2GMns1kv9nq3q9YuMebymXfhf6WNdalIQAkcgTVQLdsxauOQXPuGeEjroaJxPLpL7oad
         lRAWFBzKunoBS5zmVcTYyUMz/VxVeT37uC5rEcXQPRWZcRuaQqr0SEmFrvWYnI43B15A
         /5VN9SvDdYQXucS5eyReD6XgGE09rHpLq7PlhoU59wiJ+oPID9WRkIKzILzQSd7JmU1m
         700Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+BzqO27RUXgeTHmFVeGizQwTyHDLnaFgp9pQ4Zw5hCxvDAKUku2h5jD/JFle40zR7i56p40Gb7M0Onwg=@vger.kernel.org, AJvYcCWeIyYDPkWjLo1aoIvhYGoRNHmbqxHrSmEeOzG60LMWF/aI/zbszXXCg7xB+oI44M6dz3sKRfljopmJ87HUZTPvWfs=@vger.kernel.org, AJvYcCXJwqhzV2BoM8E/bceWEZCFfhL6d8S3bPd4+vmf/GWT9KkxkY1wl5invN3w/9Oa+g0KR3/NHZnjkNNwnkDxsJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu4tTLYsuD9IbpJZz3lGENUTB2eueSc2VycUvyoX70wc9y9kmv
	JkeG4EaNWJxO3U7chhoTQyZByWU2NEhmI0a06JiKWVIlegxxPUWAR3e3
X-Gm-Gg: ASbGncstxmYQ7G3Q39zKhrXtIRthRXCr48elZV3uG1Px1Nw8nqza9NJYuEL9Jv1MIn3
	7IvhZqf8VtKXMoKjbDGCSZLmz9/b173C4GgwoeLB7xwWVjkucGaDfyuFClM4h361xsSIHIh5PHX
	aiaWl5D5GlFTpXB5gcrL0te630DuIE6Cia+/RAvHOOvjLCExsuwd+LaObMW+lmFuB+0lMno2hrz
	m+xAPn4cbR6zhUAT7EJUD0xXwhkUhgQCvlJtDilGwew3DPFuSKNkUxe8LmDWU0vcotCEQ+PFyLJ
	A2mrdeSqLltd1eP+PbaND9AYM23AaFukX8rN23F/0gJiuIOggWe9NiF99tyMRvNu/96/qwtCSG0
	pctvDJBsoX6w+iLTbyUQ=
X-Google-Smtp-Source: AGHT+IHa1b3cujQAtRtLcYgxYEbxpp2/kxF3qBDklt7lTsFCz5uioodOQyVSNohIJ+voKNe5wjEVDA==
X-Received: by 2002:a05:6000:4112:b0:3b5:dc2e:3cd6 with SMTP id ffacd0b85a97d-3b5dc2e3cfamr634259f8f.13.1751918484075;
        Mon, 07 Jul 2025 13:01:24 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:d418:e5eb:1bc:30dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b97376sm11268995f8f.61.2025.07.07.13.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 13:01:23 -0700 (PDT)
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
Subject: [PATCH 7/9] watchdog: rzv2h: Set min_timeout based on max_hw_heartbeat_ms
Date: Mon,  7 Jul 2025 21:01:09 +0100
Message-ID: <20250707200111.329663-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update the watchdog minimum timeout value to be derived from
`max_hw_heartbeat_ms` using `DIV_ROUND_UP()` to ensure a valid and
consistent minimum timeout in seconds.

This avoids hardcoding a value of `1` second and allows the driver to
adapt correctly to different hardware configurations that may set
`max_hw_heartbeat_ms` differently (e.g., based on the SoC clock source
and divider).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/watchdog/rzv2h_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index f0e2bf786acc..9c11ce323c16 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -263,7 +263,7 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	priv->wdev.min_timeout = 1;
+	priv->wdev.min_timeout = DIV_ROUND_UP(priv->wdev.max_hw_heartbeat_ms, MSEC_PER_SEC);
 	priv->wdev.timeout = WDT_DEFAULT_TIMEOUT;
 	priv->wdev.info = &rzv2h_wdt_ident;
 	priv->wdev.ops = &rzv2h_wdt_ops;
-- 
2.49.0


