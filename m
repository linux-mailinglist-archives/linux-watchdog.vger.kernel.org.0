Return-Path: <linux-watchdog+bounces-545-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 870BE843C5E
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jan 2024 11:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 278741F30042
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jan 2024 10:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCB37F477;
	Wed, 31 Jan 2024 10:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fcUhICZP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6967BB09
	for <linux-watchdog@vger.kernel.org>; Wed, 31 Jan 2024 10:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706696449; cv=none; b=OjZqOljm+RsOyyUK2+meNsvUI64CwlKGic1qJqFWe/RAaCx9gzDN/c87oNjZftifkxHRt0Iju5wx0cCHddBCWL6dtMuvPvkmKjoLLfYu5V1tL2x6S20CWzwHiwNPwOBlV7J6sf42zWpPu/eQhAgcnHsBnzRd03I7uR4fXRZ+ilk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706696449; c=relaxed/simple;
	bh=wT2twA9lBFQ9GfBDBM65zJOM0hifl2dwZasWPoBrtWk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sJmJGIDoudAenUsKzJ9a9mvANOdZRCEHiik0ypQuWWXPUYbsf7mSZI/tnKGHPcpV7QJ59zClJiAkJYj19Cyeo3E/5IBYlel0sX683qoCu2GL1FgHhz+WCkPUGaQF2idbRFvHt+GGGURgdH8YZVyFrmhHj7ljwH/nKuN7KFUDbOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fcUhICZP; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3566c0309fso448001366b.1
        for <linux-watchdog@vger.kernel.org>; Wed, 31 Jan 2024 02:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706696446; x=1707301246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cEqK4k1A7PVq0QJziHE6k8iVWTQh9yIWRh++Qn1t9A=;
        b=fcUhICZPGSIa82MpzbXwIBdXgsWC7+x2I4AZ5wlTGDTDBqZ8xNRjmri13y/afrmhLP
         M1gcAvsGMKf6cZAV4bg7hProNb9znfoCxhg5cv2Y2yfOBLfL3u6Rw++jostXa1eEV+1V
         mqWbz4Z767YqdAFIMmIjWYkl39Itqa3nV642LOv8Mmu7HbwbX7i48SoF0OOP0mZgdCup
         kcI6CUkMwOwMWPOYm9JpwqFhPkKYZH2WSLlG99UWQIhUSJFJbK0xu+eskCxsGIHub/0m
         kH9itJegyjZZkzCmkFLtyG/T9NMizoPFPIBrxXOnRC7+5HYSocIdpK4zI62K3McRdhG6
         fweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706696446; x=1707301246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cEqK4k1A7PVq0QJziHE6k8iVWTQh9yIWRh++Qn1t9A=;
        b=InC4s/sPalNELvlmjxXS/Ci+rzR7k/jfusNFX+WzSZjUFDi60qnkikjUvocwwCKuUv
         RbmXCdwH2Hzbb8iczI9n3/XrRn8siq3sUlvxfg0Er3qITvDgLMM3OqF+grPMtB7/qIlZ
         AVK+0mjj85zFJbIh9bj7zkL0pcuUgvRReInz8lfbcf9quwN2EeS7yq73xip0VibWiWOX
         yk/8L5cYkPJa+XqEG9h7xiYS4TrGtSRXoytgJesvcnQwe8PS1jo1jCcoVjHxTMvvHomo
         zAE4uzdA679ILzCptKclRwtzYHhQbnoTeDck+icg31tuOAuct9ezDRlNh8SmsyMmO+Mr
         ZAmw==
X-Gm-Message-State: AOJu0YxyyIRgsMuNHr8bkKXkLF9X9LCuL0J3Q0f1i1uJZVElr/bruFBG
	xpJzpdr/VZQXx3/zi9uYX5oSn1omc1zGEQo8Z4NFdpCIlHoOBI+xZ/eztkRSK7Q=
X-Google-Smtp-Source: AGHT+IHaruO06vu0kGjs4fVXjxYqlkZO5gWImdkgO8i59fTy0v8FKtn34c2CwaOEyfCvlfz6+Bu/Zg==
X-Received: by 2002:a17:906:7fc9:b0:a36:8b9b:bc1c with SMTP id r9-20020a1709067fc900b00a368b9bbc1cmr354388ejs.71.1706696446075;
        Wed, 31 Jan 2024 02:20:46 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXkZpikAZ1gjM9N3uZkKy1KiYWhb+LW7nmrtHggi4T1YOS7pUcDxpKM9MasBpWNrR+lGhTEpNuGopVk2ok3CAS53EIKVQZXGVcpznPZUixLv9TlBJhb3BYdr54gqaDVxKESFTHQLZ2Zfde3FGRday4OCNKe5mYc9/JzGyJzPWbSgyhUOwW87KidZI5I1B5K14Q+C8NHTp6vDUNIyWDm4jlP3ugSG41QidEE13lsai097p/TvfbYp2keUynLLFSVrdiIyntAkmNcWv38GCGtvUKlTqA+SYsLpWokEDKL6viW35iObmZ4PV5SowHz4up/ujXFuo5qshCbLZu4Q6icGJa7nmq5idcqhj/dGo+AZY6TxAS+8xxUoTT3ExcXGkBK8kUqVYncL/LgievwmEO92f4Rye/s8c4gYngEc1Kw6xfv4AqXmuiYAy+qFX58nNogufN3ATFIoFnK+NbnAOan2wWfDsjbI1oknZ+COywXK1S8iwPC7mSbK7zc7SxdGWpTeKsaDTWzKrdyzLmNZ2YndKiFWocd1iD96Hm8/CazyJBYBJQGHvDWtpq0NHvUiAw/Fa1PfbodEn/Is2CxP5tNbjPQqhkeqEapy0LKTsziHWdYarU=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id vk6-20020a170907cbc600b00a3524be5a86sm5212966ejc.103.2024.01.31.02.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 02:20:45 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 11/11] arm64: dts: renesas: rzg3s-smarc-som: Enable the watchdog interface
Date: Wed, 31 Jan 2024 12:20:17 +0200
Message-Id: <20240131102017.1841495-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the watchdog interface (accessible by Cortex-A of RZ/G3S SoC) on
RZ/G3S SMARC SoM.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index f062d4ad78b7..2b7fa5817d58 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -336,3 +336,8 @@ mux {
 		};
 	};
 };
+
+&wdt0 {
+	timeout-sec = <60>;
+	status = "okay";
+};
-- 
2.39.2


