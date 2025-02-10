Return-Path: <linux-watchdog+bounces-2899-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8329DA2F7E3
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 19:50:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD66A7A1BF9
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 18:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4B42586F0;
	Mon, 10 Feb 2025 18:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9FpjaF2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C7E257AF3;
	Mon, 10 Feb 2025 18:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739213379; cv=none; b=p/NOYfIwy37MKnIeYtqr9cNs4Jepw2YdX4nJsclVBtKHHw1iippQga7YK9Va8Ojg6ajj0ZyhPwO+vX/z8Tdlm3R4dG/OUp+LlbrLJAUkVZwulQQAV0ahYhvnpPnVrelYhljieYM5coiCLR2ZpFL5kM5RHahJ+CPD6oG0WaKE1SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739213379; c=relaxed/simple;
	bh=JW8WXeGhwkTj/u+SIfC/LcplUpDFNlJ3w4JmvgB1U6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RY9RJn5ih3zmzKSWLRoxGVnHyvs9socak/EeO0Ng8Nomn2CmU1/vRcCnD8RaKVSh9xuqppQLpH6oMhbIUr2bnFfz9bIdbQNAB/0HcdwRCnSkEq/fA9HeqC/FoXKd78JKT91U2k4KgZTNfiqueJt4HbIwDEVD8VKzB7uwzTSxIjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9FpjaF2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38dd93a4e8eso1552208f8f.1;
        Mon, 10 Feb 2025 10:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739213376; x=1739818176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgmTlEFFErCjgcASm7njArgbXrrj3ZoAMlivlaHohlU=;
        b=N9FpjaF2M2THLIaN1NP+JGD0i1qtqmzV7xIGO0ujco66IlS2x6v9B/Jw4tgHP9DXC0
         s0pGage6uaRpOPeZ+Am5Ci0HxQGcB95pzJNX4+/vRjYKJctYAurauEHYAbq2b9/NxhNw
         VILOHaanxzf64vwAqmtRu+NwQLbmh91wXEm8zbCe8mo5xt2V5C50LqRXRnv8DZczakXR
         9j2T0z52e1jTjhy4G6/mKITkz9mcwliENpXniqgwf6rN+WlvkjjMYWUMnEohWUX4dE4P
         h5345jdUcdul6wmbnDIV5iNyDtVHD0KSybR6zz1lCXdVfOZo33Bcr+cDD+yZXX1kMJIN
         K07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739213376; x=1739818176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgmTlEFFErCjgcASm7njArgbXrrj3ZoAMlivlaHohlU=;
        b=lDzpcvizfmTsHzT5TDv6Qc/s8AoFZaSXXA6TJgqkfnTEUJhwZ9fJPBqagUg8jcE3Vd
         QGjd1IDIt10uaJdoAJcErjLLcOWpkNxrQDisKinrApamziQ4pIm3Z9pql+UX/MXjOWps
         hgMBqxoL24TS5CHjzIQXU38xSws7cZ6hfUYF1eyjUhY9PXJEE7idj9gzvfNwWGmOrMz2
         a3j31dKR2TA4odDD4Y+bNwhD/Jg1v+TpCa8/bQZzGz4sJEIMYymk7r6yDLrTO6izGD6L
         LVDe0P2jA1+s0VM9tIUpNVZBGqcJfALQtdcL9HZhE32+qfN3GZ3it3sfx+27h9NlnecN
         StLw==
X-Forwarded-Encrypted: i=1; AJvYcCU2bfob9BsnUiUeTvAgpyh0FIy8z6v3SGPB48yR1ZJBUU4SaLveSC5CSJ1U4Mk5tIvudIgcnOiEF6Wf@vger.kernel.org, AJvYcCUeynOq62ABFxTECnP0UCcBCgNyZGzhTh59qIwiVHSjUY68xIdHF6UJuR2YZSNK4PqdZ3nHi9hBtDNCDOW0@vger.kernel.org, AJvYcCW/CP4uHkWv8p0w9A/O8SyPBnnV1lSvrtcx+CAKBw8AGt+CS+wsL+Su7AHzWk61CV2jyuHcHgkzg97s@vger.kernel.org, AJvYcCWWQjjtHmaq2g0xHu32frgIBSIrVpiCUiONiFUVZh3xzhUdbgyUNkUtO6FhDLSG5mEtNcT6VDbkC2XKZIssPwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM/ODJFPbvE/QADSiBacCaqrKaIPRtrYd1Oet9r/9+rIs4M1KG
	R3HJcrzufg1gprVlzA6megVtWkb8BPc8BsWo16N9jzcZyEB6OTQQ
X-Gm-Gg: ASbGncsU5d4yod+y298vlxZmCYZPtKcYT5Rqx4AYHQOFNIrWajmwGLulqQwiAEfYuFM
	FMux7qyIn+vlgNv3zICojfIixlOjzk9IsY8UcbFGk4P0ntpKpHp75x0yl+hCCILN939g11lu/W8
	QV6T48ytjlsEcsFyRN3cspeuDUZYQ/5jg7pmcPqe+t4LLxh+JVCVBLKEBmasV8W6SIQQk7avqWe
	UhfPdKo3VFKxyjOvBtnQ+qdJcx/nLKYxtai4szBKd2A0lwG1xKYbUebvQDduGmDizNC1ICAkg6s
	Y7qfEI8WdY0+CYI/f2CJwLkbN+PDs/vTlKww62W7oIJp
X-Google-Smtp-Source: AGHT+IEjfOsqbZlHKDI628m8fgisOOWzLpcuCibpPD3eDfptKdVhVVxFs9uJnIm7MZhNPcmK9fxnww==
X-Received: by 2002:a05:6000:144d:b0:38d:df21:a51a with SMTP id ffacd0b85a97d-38ddf21a881mr5572000f8f.16.1739213376260;
        Mon, 10 Feb 2025 10:49:36 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:b833:1deb:a929:b461])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439452533ecsm22911525e9.0.2025.02.10.10.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:49:35 -0800 (PST)
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
Subject: [PATCH v4 7/9] watchdog: rzv2h_wdt: Configure CPG_ERRORRST_SEL2 register
Date: Mon, 10 Feb 2025 18:49:08 +0000
Message-ID: <20250210184910.161780-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250210184910.161780-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250210184910.161780-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Currently, the watchdog driver relies on TF-A/U-Boot to configure the
`CPG_ERRORRST_SEL2` register. This register must be set correctly to
ensure a reset request is issued upon watchdog timer (WDT) underflow.

Now that the driver has access to the `syscon` handle for CPG, configure
`CPG_ERRORRST_SEL2` directly instead of depending on firmware. This
improves robustness by ensuring the required configuration is applied
within the driver itself.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4
- New patch
---
 drivers/watchdog/rzv2h_wdt.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index c9bdaa8f2e3a..04b8ee899353 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -43,6 +43,10 @@
 
 #define WDT_DEFAULT_TIMEOUT	60U
 
+#define CPG_ERRORRST_SEL2(x)	((x) - 0x3c)
+#define CPG_ERRRSTSELx(x)	BIT(x)
+#define CPG_ERRRSTSELx_WEN(x)	BIT((x) + 16)
+
 #define CPG_ERROR_RST2(x)	BIT(x)
 #define CPG_ERROR_RST2_WEN(x)	BIT((x) + 16)
 
@@ -246,6 +250,16 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 				return ret;
 		}
 		bootstatus = val & CPG_ERROR_RST2(bit) ? WDIOF_CARDRESET : 0;
+
+		/*
+		 * configure CPG_ERRORRST_SEL2 register to issue a reset request
+		 * upon WDT underflow
+		 */
+		ret = regmap_write(syscon, CPG_ERRORRST_SEL2(offset),
+				   CPG_ERRRSTSELx(bit) |
+				   CPG_ERRRSTSELx_WEN(bit));
+		if (ret)
+			return ret;
 	}
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-- 
2.43.0


