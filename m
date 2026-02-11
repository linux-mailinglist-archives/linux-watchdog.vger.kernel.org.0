Return-Path: <linux-watchdog+bounces-4931-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DJGAk7TjGm+tgAAu9opvQ
	(envelope-from <linux-watchdog+bounces-4931-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Feb 2026 20:06:54 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BB4127057
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Feb 2026 20:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFD3E301CD9D
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Feb 2026 19:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684BC352C20;
	Wed, 11 Feb 2026 19:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jePlMSB9"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0E7353EF3
	for <linux-watchdog@vger.kernel.org>; Wed, 11 Feb 2026 19:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770836798; cv=none; b=R+CKrW8l7b8yM26cIA44llqra2EvEjwzRzWXLY3Z5Dzhj0nUx0NHjDgGZMtTv9BR2xfTSJGerhCEqjoA4lS9k3CEGoRjFbYryZOFiX0IE6ZKEeo76WnoyCvhcjESj0EeHuZPBr2NOIx9RScyzGHe3l+Kw8OFNLk58RianFIGVII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770836798; c=relaxed/simple;
	bh=FPn+xX+IbNMdR9qg0pA+C2JrAY3hI8lDAl20KwJ71EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+idrOlqvcfHGD5qJNO8aXFxgQK18eNX90MppJ0lkNQYn64SW5lV9SuaabMMREUemW6+M3+zb/aiYh9c3AIyQDoRNLBnoyzmY3tDVOc61QLibrCsO/oY1pywxxpoAP+Tw1SSYW9WPmqy5eUJVgKHpMoDrj+P6wiva5siEOwlfBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jePlMSB9; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so106688375e9.1
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Feb 2026 11:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770836789; x=1771441589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92SAHgAplCp4yQb9ApiGrHWDXrzlV3xmhRggcLV+hYY=;
        b=jePlMSB94riIsRXO7EHLNPi7KbJW9V2BhtSGYN03N34kNrpf2M6tMKLWgWMCZKz8Gr
         mNVdWwnlm//LnhShCETseJx2WRKkDyqLexMoj4sO2GLYjnqSshFKIjsClQiaFuwWg3GB
         99VQRngWUNgR7r5e71vvQkjieSsI2i/+jPZsRm/eCffBCxZnwWGfXarADmVutnoU4WJf
         gsT5Azmk6t7LG2SUNJInoKT1lXKc4N3pmjDg+s5L8XYjdfVoNSmFZPBG0p0PtStJHU2S
         KFG7ZoVAPpOJCxaBqgi8l8jvPOeod0n+1O95Dke5HzE52yZp3gDUtbGU8VpHTDLW4TDs
         kMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770836789; x=1771441589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=92SAHgAplCp4yQb9ApiGrHWDXrzlV3xmhRggcLV+hYY=;
        b=Y0d1yLmACKzwkdWbi26y8hyFejuRa4vJXE5AMyujU2OpaZgzigp81nOb507mHWZ6IG
         yWNIWg/VfXqfv0v3ZfCseS2KPO0ufIIk6nn1jD8m5U7p9cIpnklIRNPr2Am62eLpXkCG
         VOO1NNaoaPQIQuSmQtsqIfx6GhGbcLj+jM/Re6fnnMTX5Gej0ghOKFNS5Y/VykXAXGkW
         SsPSL9kwwAia6sjdw9yC4jY/d4DitRvj86dPRozbdGx6UklpkiU4hleBH4XCC7pR4sut
         LfalDQaQY+LknZ+grGeXzYEIe26jFvuHyzDa3SACxU/THiBKmFufXrSXLyOQ2pOCu5+i
         Hlyg==
X-Forwarded-Encrypted: i=1; AJvYcCVqx1qil7FRz+Ll4qkl3D4XuiLLEBBdPy046I1XjKELpiMKFmP+z7Y/WMfhkM5KER9x+KnQRTMHcOEtc0F2Og==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOR0oBwGUN/sP/a+ZUGvE94fhdG67KosaKGZ3y4+/J2FFVp9Ar
	+coU4/Nf5zlOE4e5cP+NPEwqpfBR1gbL2GT4x0OsT7ffvu1MFLlF2tpe
X-Gm-Gg: AZuq6aI5lvklnNuwRSmRrCdIP+IpIfEpNOtxSwETQ+btvep4UOWsCYLBocuO8nUYH4Y
	NnhqEd2aodRf/SlbY04dtWb/RUzil9f89biPFpWV2g9RxVMwmKPP/QRPMUAUCqTrYlCrq1PVHlP
	mHcRtss/1AAWft9wOiF2U/IYWAP6zLvsxQrF6JS4YayntTmklqhbYrNzkQp+nJy7LKZBI7JxId4
	yjXi4bPhD/INv/0Wduhc8yxHcpwjpBX9ZBP+GTc6oY0NVd3MsB5Iu1d+M4ta3YmhWG7tcIRN5cK
	iW3l9VvYoKGcwszyBNHPRpnt5AcSDMH4afTCIM52yNHIEFSG430d46Lopcifrsx3PbN0NqZzhus
	ddaAXs6CpZpL8FLSaanCEi+K9pu6DFtBE3Oe7cUXqAPnIHp+5yeZmPweccSPTPtFgBPJyXZ+zqR
	tfKbpavbCzPy6BoMsicN4=
X-Received: by 2002:a05:600c:1d86:b0:477:7bca:8b2b with SMTP id 5b1f17b1804b1-483656c1151mr3219115e9.15.1770836789098;
        Wed, 11 Feb 2026 11:06:29 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4378e122df9sm211223f8f.15.2026.02.11.11.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:06:28 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/7] dt-bindings: watchdog: Support MediaTek MT8167 wdt
Date: Wed, 11 Feb 2026 19:03:25 +0000
Message-ID: <560b1985c911ce25950c9caedc42677ae01fa8bb.1770836190.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770836189.git.l.scorcia@gmail.com>
References: <cover.1770836189.git.l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-4931-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-watchdog.org,roeck-us.net,kernel.org,collabora.com,pengutronix.de,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 73BB4127057
X-Rspamd-Action: no action

Modify dt-binding to add support for mt8167 dts node of wdt

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 953629cb9558..f514be8a5851 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt6795-wdt
           - mediatek,mt7986-wdt
           - mediatek,mt7988-wdt
+          - mediatek,mt8167-wdt
           - mediatek,mt8183-wdt
           - mediatek,mt8186-wdt
           - mediatek,mt8188-wdt
-- 
2.43.0


