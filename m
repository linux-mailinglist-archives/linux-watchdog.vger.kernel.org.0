Return-Path: <linux-watchdog+bounces-2894-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 677EBA2F7C9
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 19:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 104271674FD
	for <lists+linux-watchdog@lfdr.de>; Mon, 10 Feb 2025 18:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3EA11F4637;
	Mon, 10 Feb 2025 18:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9qttiIn"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B60425E459;
	Mon, 10 Feb 2025 18:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739213372; cv=none; b=jXR27b/XX3A8wmre3uV/3JDoMQiCqonNnBL/ypMwrZnOxjzEBkDAvELL4LL+ZC8TEb5V4lK/UaItVb4yzuVtYIlr3A8zJMwvCfTxveNOdArj2k13XFps1/WIisAm7Pk5jX0+HST53OWo6887vgesZFmsG4UEWRZ8gRBg08b/k68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739213372; c=relaxed/simple;
	bh=aH1QfxsEIKCSifPR3xW2PO3iQAHiPyOQdo3lMnaY4lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g4X8NWgU0XPx5SZo6TRpCbK4dyOpGOWyw5Rl2/nrtNEaQv3LmzK0joN9oUCOgip1eJGqYOxpr0CBy287CFPVU9dzAnW0mJ2wLoUhj1JAOyWgkZFlLpx4ZfE6rcdakZiiy8LBZHvBdq35J+Ag4g250UCEquv2KRcWXq0hL2iougM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9qttiIn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43618283d48so32754485e9.1;
        Mon, 10 Feb 2025 10:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739213369; x=1739818169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4SMcy4c2ykgFJw6r3mszWTvZJf63Ml19kBaIAyueyc=;
        b=B9qttiInFABuXO4FrV7YZpCGQXyyuzKpTcpVQaIzpqGSBTrV4WtuhRVnHBLCNCOvLP
         Fz99tLLX6KKdGS5x/BgJ57zeZxrZFOKAjHmZaOq9qopEek+azpABJSBDysE/VyxAdCvk
         PqZRVL7z8/EXbPRkMteC6Wk3+wVbTHQgZbGxdZskQBatfm/1PmZnVvKw024Ag+fz0L4a
         n0hBx4qDAPHkz/V1SsjgMKA+R1hSQ1+D2rU9OHc45REnTeEZxoFnNosL+GHGUGulRYtO
         nmnHMoO6N9TqltYU4EWxRgZkaN4spOZvYEamx1ijsJyM/8ElI0ug0Pfvd9RZX9NJnXLP
         SMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739213369; x=1739818169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4SMcy4c2ykgFJw6r3mszWTvZJf63Ml19kBaIAyueyc=;
        b=FcCmF6zHeHhS54KQ6hNzRTuYc3oWJmDELLV4e/So/x5UXKcNafZoJ6os5aBmrqy1wG
         J4vV8y5Fdp2gj7zt6tpMbzy06ypiGrOkuGJNUIEY0SlD2cuOPmDTfmKBuk0EbLoUq96M
         1dMM6FY05gZMEKpAtmQzFdNJcHxyMLAujFhxNSzlLc+i/CgcV8I+VYXOrqNRc9u9fVuy
         QVTBatcTB2LgLDb8oHBc48totEWV5UNZrbzJ7V1zMKWFH7FwW7chDL2i2j4G+7t5crp/
         PZqT1Q91KLgv9g4uiQlDbMypHSpJDopx9NsAiZpVBF1WXe4l7+QPFWOKr4sNNoqZrGVJ
         dkxg==
X-Forwarded-Encrypted: i=1; AJvYcCUkvtmpBTw+Ks34GuUkn2x4gERzJQJboYj7iDPW7Ns2PryijIYmD9hFPOy4t/UNfWrT3xHOd2lvdshZR6aE@vger.kernel.org, AJvYcCVfTZgLmLZfRQa/vC3xXo94mxLOoayiC98HuJ/8hrCtjshpBT+MavP57mBBkyW+Dodvw1GNbVCXCTHd@vger.kernel.org, AJvYcCW+7+hSzGaJAcEi1u/3X1Fms5dx5bpNHtYgjbwpHRS9K7FEpIF/mfzG/RI4uD0fy0IbGsjqIXpvEJb5@vger.kernel.org, AJvYcCWES+isFJKcIiISVpZgW3uCSh33SfNirNoDbqe5kPYB0TvNd9Z0jnCGeTmCT048mArywx0TSxHcyF+6+yZv4jE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz76gGPXe3ttHkmS6JQgfB/JHNDcaf6A4SUCCphMe18W+cfgbHy
	Os1/W3UvaSjwKiNCFRYKhaiVMLNSCP0xYQvNBCeTAjo4f6G8HiuHzREoO2tA
X-Gm-Gg: ASbGncty3C9yoCdn9YM1BrzNBwVJfo1545OFOHHwrbAKwmbPiKBiQYY5ZgSWqNM2zV+
	kA05CJRjITxWx9e+jSWZAkOxe/pqCsTy7q8wxGIlXraUtkjvuhaHSZeoGYJib5tWsf9OWi+nBF3
	8IRsNYBV8ChCNfjpLGIthp5VYCvSOcvgmmVBvtSvlcHQtCgCX54m5zLwJZuoMHAuGNle0IUfK8O
	DzOP/vXWVr4DlooqmveLcjVljEPcyHoPhCLG+PsBh7H7x5KStTTpBm+sOO+zCCSZu1KytPtkJ65
	jfr4Y+HMgBTRAsneooFI64FLzlVuXXnikKQ1qHs+m9Se
X-Google-Smtp-Source: AGHT+IElp4tKDyC2Q0nc6jNWUoIodGczpkX60vijflj0ua4yqYLSeCKSRaeaDUhoY6MN6pq7EVqWTg==
X-Received: by 2002:a05:600c:3592:b0:439:4a1f:cf95 with SMTP id 5b1f17b1804b1-4394c74fffemr11247875e9.0.1739213369156;
        Mon, 10 Feb 2025 10:49:29 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:b833:1deb:a929:b461])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439452533ecsm22911525e9.0.2025.02.10.10.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:49:28 -0800 (PST)
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
Subject: [PATCH v4 2/9] clk: renesas: Kconfig: Select MFD_SYSCON for RZ/V2H(P) family driver
Date: Mon, 10 Feb 2025 18:49:03 +0000
Message-ID: <20250210184910.161780-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Explicitly select `MFD_SYSCON` for RZ/V2H(P) family driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4
- New patch
---
 drivers/clk/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 5a4bc3f94d49..617e824004b1 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -240,6 +240,7 @@ config CLK_RZG2L
 
 config CLK_RZV2H
 	bool "RZ/{G3E,V2H(P)} family clock support" if COMPILE_TEST
+	select MFD_SYSCON
 	select RESET_CONTROLLER
 
 config CLK_RENESAS_VBATTB
-- 
2.43.0


