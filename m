Return-Path: <linux-watchdog+bounces-2633-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4C39FD720
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Dec 2024 20:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19488162CC5
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Dec 2024 19:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74DD1F8EE7;
	Fri, 27 Dec 2024 19:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbpQKftN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9401F5F6;
	Fri, 27 Dec 2024 19:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735326165; cv=none; b=IZIbJUsBvUzkKm981ja+DtJ62XKJFQi/QOP5/xgHihZeLobzbh1jx1ZNiuRLaJEzisRFIJCbyl3s8jkhjGCtNt2NPTTs0ISUlpwSUO7fyakeIc8PWUVxrDoigLBHGUJFUDBrI/N3Z0f2BBcQjGjUcZIxPn+d+UMXa4JMCSXN8uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735326165; c=relaxed/simple;
	bh=XAAwGWuQvLZJm3et2iUG+rXRiRXPAXTUUGTAQQgp/7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dY1oAdedmGX/2DVu8VWp7etzBAogcC5ls7WwgLPnou6/x/zC+jlfwSb0F29/BFWM8K8GEssuBK0b2xoES6q5I8ERoBuU5LC5ojYpfjnxWsg+n0ww2JN5npmcArqGkRO1fpYio91yb0vcZ1uz/4YnAAdoS2KMSIobcFhzjwlCH3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbpQKftN; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2162c0f6a39so100528295ad.0;
        Fri, 27 Dec 2024 11:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735326163; x=1735930963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGGPQFy5JSmrVFGQ6uGOo4ajk3nzGtuDd3+lZ7f7qEE=;
        b=ZbpQKftNnMKdv7P0twpOfdwm66VOcxUyAt+WDM6GPog1riisjPR/LXLQMjJAfdy48Z
         OfVW4sveqJt4QFoToVuczWllck/xFODS3QgbcJR+6zjVQuZVnuoeVTXrUMfJf2pdYnF9
         4g/P2ApUsyXtC7wusjuEctuuLpRpI7HmTsnwm8FSJgBIt4vZDydPijTs5DT9OjdfC379
         NWPJVYkJkj3L/R/3fp4IE++qfsxQ0D/buKkhMFq4OL6us0RWD29xgjtHWPbwfiTmiY+N
         arHS4/wPwmnSEIHrRUYKirROvMquJRe01l1vZsqEwwH7iXS7Dx9zigOWXQLuFqYVcGKr
         ETUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735326163; x=1735930963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGGPQFy5JSmrVFGQ6uGOo4ajk3nzGtuDd3+lZ7f7qEE=;
        b=Dakjo95plgr8nmlPEzNoPpR/G2jJkwCbvjCH+p4+D6Ii2gGo2KS2ujA5rVN1pWHgdu
         os3B5pMlIz8T+Sv1BMQ6tlM23CTpvz4cpp8Q7D8Uz61U4Tyth7StHmQHG8WRxdvLemyU
         u8qTI2api+EHIUmr1TFVS+KV/rrT0V8y1Vftm6+mW0RzVa0+UpUzQjISNYwupKE2rThk
         IgpWe+92JGXPUZABwYt9TDApD79DlJk1a7dmf/80+SxKAoPDj2UnXbWg2SM82F3s9LC3
         5rgkafRorqdyaqolCDvc5jy8cnqvHT6Y1MCaizoNC4t1MqPaWK5nxnlgETdEDSX9E4ay
         qtjw==
X-Forwarded-Encrypted: i=1; AJvYcCV61vkRdhUPIs7zC0iggwHjL67fb0ISLxSj4aSvZQ7bclXUQBiBktIuyfTY5LyGlvz1vPy6FOXN57dmo4uzlTs=@vger.kernel.org, AJvYcCVO6S0w2+008a6Q+LrxkBzkq+0Jd2Culw9NNYnT7w8tm6wASXCHUY7VJUXPmQpgSddZpp5M9H3f3hJfiWzn@vger.kernel.org, AJvYcCWM9j8mNSPiG47HEwCmF+1ywiAp54kEipxmA+zFxuJQc3jvyz7XKUurFEd4MDrMKk+IT9niK8NcE/7v@vger.kernel.org, AJvYcCWaWvo5GC6UPcFxsAiQ/k0sC7/C0U4dt0m2mbw5dq356fHJp6Ddc8hrgAdiZK/48VdCWLVDHiENhWSS@vger.kernel.org
X-Gm-Message-State: AOJu0YxGNZtx2Ns6fNnxCZwvqaQVArt8+m2An1JdWX1BZNCbsTwp8BmL
	5xtSMt8MIT3ojMvw6xzasXMbjJzTo3PCS1txz5wmXgSvfkw2MmOJ
X-Gm-Gg: ASbGncsDRrXUTH/CZo8khu9bHxLX/A2ax2TIerF0v9aOyTxWG3FsAh5s6pipnFKE3n4
	6GI2rRccKbRs9e293YtkqpLGsfeBSjjSnaEQs0cjE+azqeTUK4fvHEaPcCyiSgpP6Ft4PcbZCYL
	u3yK/0gfPavMjDydLSoEYC+R/uVcqNa88pQMRGIEl2bzHrYPzoIa04Dpp6NTvGInv8rihNQogpK
	dkDO0tYEy16MoRVQ2S7VI4a9rKc61bpm/RIzbn1vpIkg5S5VLYrL7fV2Mv/ptZ9A/RZ9TDZAGbx
	FyuKcp4=
X-Google-Smtp-Source: AGHT+IHxuO/iCAxMeFImMp16+uJBiSzllRRENBLYVjxjO9Zzx3O6+48qEZnXm1glw3NT92HpW29uAw==
X-Received: by 2002:a05:6a00:820c:b0:725:ce39:4516 with SMTP id d2e1a72fcca58-72aa9a3edc8mr40378367b3a.7.1735326163577;
        Fri, 27 Dec 2024 11:02:43 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:9010:ac08:3a91:844a:cc65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbbd3sm14877943b3a.110.2024.12.27.11.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 11:02:43 -0800 (PST)
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
Subject: [PATCH v2 2/6] arm64: dts: renesas: r9a09g047: Add `syscon` compatible for CPG node
Date: Fri, 27 Dec 2024 19:02:06 +0000
Message-ID: <20241227190210.69025-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227190210.69025-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241227190210.69025-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2
- No change
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 7a422e9ad29e..f4e865b534a3 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -132,7 +132,7 @@ soc: soc {
 		ranges;
 
 		cpg: clock-controller@10420000 {
-			compatible = "renesas,r9a09g047-cpg";
+			compatible = "renesas,r9a09g047-cpg", "syscon";
 			reg = <0 0x10420000 0 0x10000>;
 			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
 			clock-names = "audio_extal", "rtxin", "qextal";
-- 
2.43.0


