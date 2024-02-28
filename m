Return-Path: <linux-watchdog+bounces-744-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D075186AA22
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Feb 2024 09:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 085541C25132
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Feb 2024 08:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7569B38388;
	Wed, 28 Feb 2024 08:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LW+AqZue"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06783838F
	for <linux-watchdog@vger.kernel.org>; Wed, 28 Feb 2024 08:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709109212; cv=none; b=pK0982GmIIVGdTqZVNVlSd8HkIimjCU6DbH0ciyx248NsUEXFGfed7DUDPnQsKLHR1YJNHA9oTh35OenoAudJt8iRD4aLuYcm2YK6JqGVClQKLE/MqROAYXt6ptQzhn9XB+GSqLDXMc+jHXQPMDUjr+lkRSpsqsePyCMVod/9ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709109212; c=relaxed/simple;
	bh=ZC6qpVtZsWIunDzHO8I7kt48MkFMR6oNCEUodZaMmHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U83DSNg7+UaLSG8AQE7yoY9u3IM0RaLaeAPZDiJxDLNr0GB07n9pVo0oKAp4HgUKK/x8csJmUAsRIVzLphKDYigxReoIqznJHdPvefccV62RjIviTIk6k6KiPtY8B+tDBZ+XouvEgCk8U68sp8B91zsOkp9Dg4DJtqwzBFxuBc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LW+AqZue; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so825676066b.2
        for <linux-watchdog@vger.kernel.org>; Wed, 28 Feb 2024 00:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1709109209; x=1709714009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udAuYdD/mEhYZcun1SYUcgN7ut6llxoEuzPE+4cCd8k=;
        b=LW+AqZueTuJ38uf5xBLpNY2i8AshSBblDqSlIYrwBEhL8EPQMP+5wKBtahbNYxmj+4
         ztTAUe6ousPTKBuNdyc//dxTo3OaZqNVQSieBdm4jBv7YZJJy5NlM3PZDr/xt+2fKFIj
         ZaiGiyob4A2sM45FFv2brotYV6u8Vqf0hssxX2Xc7wvQvcdEfrDzhyG/7Vc+u83upGwu
         FtuYj4tFDmEF+l5FxkLkPdxiIp+F1OIRcIccFJyMqX0mSWOSXljDhbehyXPtsSiqgHJd
         Us1rh7mt9W03bHYhqkKdmP5c/xFtZ8KUxDpLNGnK2T2Vj1tFjp4vr12Ildw9PemHarue
         4oxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709109209; x=1709714009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udAuYdD/mEhYZcun1SYUcgN7ut6llxoEuzPE+4cCd8k=;
        b=vYuT8Q6oaEh94LKZdRYU68pBbbIPGarSfRu/lvAaqTSKA+gTkRvRJrmZjkWpR+Wa1l
         gtEQagn1sQez7/yLF7CXmV5b/6cWbXM6n2DL329NvvJGEZZU26qr/fAc4EeJwfMdL1CV
         Gabd6GR3De+PSvuPKvPZerkaFcFOL2H7Vmv+DwHaVDIJi1GWUodQvVEyHjUG6hLDDXCO
         0JnFguDNSogoB9oBO4UtFmic66VI5897scCa5GKU9W2zASGZmn8lvwadbj4MYbPNPzCk
         DWtscq+/OlMxr3JbK3AvpInFGHrB7NnEPWqky9PDZVMN6HvlDIT/bAeDlDm4JtA8XQEC
         /wpw==
X-Gm-Message-State: AOJu0Yzt30XLv4mUZZ8yk4xj9GJmnl83H6EYjgWzT67ZFQqTcOvkJW8x
	GnrI1TxoNGuq0qRfVn2TY+g85O3pl+YZZQjldN74Ei4Lv4wjVuoVQfKpRZsjJOs=
X-Google-Smtp-Source: AGHT+IGul/GizRIl7D34xSl7OjGNM4l3iR+xqDfCLHir+BD3SnjHSpo5qT2u1y/Pkp/5IBEKPF/IJg==
X-Received: by 2002:a17:906:a00b:b0:a43:39fe:b475 with SMTP id p11-20020a170906a00b00b00a4339feb475mr5627872ejy.45.1709109208805;
        Wed, 28 Feb 2024 00:33:28 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id qh16-20020a170906ecb000b00a432777eb77sm1593987ejb.60.2024.02.28.00.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 00:33:28 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 10/10] dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support
Date: Wed, 28 Feb 2024 10:32:53 +0200
Message-Id: <20240228083253.2640997-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240228083253.2640997-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240228083253.2640997-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document the support for the watchdog IP available on RZ/G3S SoC. The
watchdog IP available on RZ/G3S SoC is identical to the one found on
RZ/G2L SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes in v8:
- none

Changes in v7:
- none

Changes in v6:
- none

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- re-arranged the tags as my b4 am/shazam placed previously the
  Ab, Rb tags before the author's Sob

Changes in v2:
- collected tags
- s/G2UL/G2L in patch description

 Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 951a7d54135a..220763838df0 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -29,6 +29,7 @@ properties:
               - renesas,r9a07g043-wdt    # RZ/G2UL and RZ/Five
               - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
               - renesas,r9a07g054-wdt    # RZ/V2L
+              - renesas,r9a08g045-wdt    # RZ/G3S
           - const: renesas,rzg2l-wdt
 
       - items:
-- 
2.39.2


