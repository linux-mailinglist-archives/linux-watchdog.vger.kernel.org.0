Return-Path: <linux-watchdog+bounces-4933-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qD+MNiPUjGm+tgAAu9opvQ
	(envelope-from <linux-watchdog+bounces-4933-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Feb 2026 20:10:27 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E84F127107
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Feb 2026 20:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0043F307EC60
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Feb 2026 19:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F91346ADC;
	Wed, 11 Feb 2026 19:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HF7CwMZP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F4F3542DB
	for <linux-watchdog@vger.kernel.org>; Wed, 11 Feb 2026 19:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770836801; cv=none; b=CHsTcTpzGUYcqtktt/YCOCbRc8wPolrmTRWPdgxK4GwvPLJZhlYti2fjdtGHDns6C6jwTe+zRrrWBMkl8X0OrVd31DJ4GdCFwgABX/73S9kvILSpfQJ3b5xa5mAzIi24uQvNu2tVaQauP30W8e8qgmu1tbF5CoGsx2h9KHJqAsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770836801; c=relaxed/simple;
	bh=xjTv0JtmEKGAGg4jDdTInlghAZr6TLEInO/r4xCXrYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ds3fhsWjxgZ7qqwfRFHznbQPupF3hJhzDvmr/FIwnL2t1kkUQNXj2l6ZxNT2IxSFCsxuc/nPtGJO3BaYVT3OC8kTH9iv7HCkOCpsjk5t47b7Zlu+l2Fpdd/l6eXW0i0WhhXwLF7LAa2PexSWjp0hXFI0Ycwp8fUX/gMORtA4POI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HF7CwMZP; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-436234ef0f0so4376128f8f.1
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Feb 2026 11:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770836794; x=1771441594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0r+DLc8EhI/TicDqMaNt1y4zbafcSJbDHtWIpZZyro=;
        b=HF7CwMZP9f60YR3LkuX7TwQx/7g2FwYMlim5cwlnovYPxdaYNIg3XAwAGtX5Sad3jG
         pBlQMszA4pG+uUGMF5/P8PiH/u4wceRWPW2StIGbH15PKxM9YrmSDK/bywskk6ohdwR4
         vzfc0XC1pCuZV5SjZaHkPt306WSqYdcg8XMvB4xXugzmsxtPUZdMTaRuq2ro+ELlYjB9
         zRjRJ5VIy1Die6oRpvQL/aq5qQYLqAE7SeaOg/FOKHwkOzUalxDd270y/zRv44ic5GGa
         95mqw8gMJ9pjpKIPfkJpf0Ygygp3l5QTf4ee1G/3J/neN6ceoFH9iwzlRXSmo9ki/Xp4
         ks/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770836794; x=1771441594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P0r+DLc8EhI/TicDqMaNt1y4zbafcSJbDHtWIpZZyro=;
        b=GEY4oH8Qzu+YvgXs9AG1w0/pPl4p1aN+h6xMoTRFQEGAW0NHQ/mXmw2W4+bGgc60fe
         rBF8YOItsQsSIGrkH8OPUfDJCdXvAy5UfKLts+YJ9Zree98bSb0UwMeO1SYM2lY/iheg
         zN9OyY+241jyVsE7dvNjpgKvEMvExTlulOqx4QK0jTh5LsKJJF82jb31/OIGnNWmQ+8+
         yAxdiZd5EsWwAQ6nxMM5BN3C6aT+7VGekVTKSszua4AFPAh1UJk6JXf951NhSjBSlbsr
         igwjN7U5EugQ/6JM4VGV3mzK3Vhg7TNqupnY2htcNn78db08zVe22MI5Zy+Jb1lRkox5
         fTGw==
X-Forwarded-Encrypted: i=1; AJvYcCVyS66DYE17NAPHHzPOl8PoznG7mcMhwv40lOzweD3Qr8rXIiDfxCsEoudQko0s2D71ZC5LMyYsfUPtnYCLuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4BZPpN6tdZ/cKgKGuKJGmmmVjntuZ+bA9Ecgf1955fumuW+nV
	6CSRpYUqe89CYbiV0+O+JE3Mam56CJ2IbLQQtHNYOrTf8hsCgW4f5cPf
X-Gm-Gg: AZuq6aJaqN5op+rbUQDLpCGMRmSXavxvjhNUZTHPx8P9Js2Pm8uRAZejGkFS8oIywhl
	7UREd0fmAXcBmzU1vJHQD689geoauynz4QCbJaC5vwGEcTqhWIkRVZGX4uQnYNkVvv+G3/VvXN8
	RsuqFvchJFtWg4Zb8NtffEG9oL9gV5rXPrC0FY7ZrOpz3MC9gcljJ5j015qCD33nT/huukEa98v
	zAYAywIxJ3OZTytq/yKkXy0QuECFExr981RE12jJpA5917xJi4ty0oQilu1JxywOg//uAnviGe8
	2gklPPI2mUKzNcgogsDRrJXs/KQ9xPlB0LSucxJ6Gwjs/7yWhDHS2IEtTueiWONu7Ip5B6ZTfWZ
	zImPsRy6QJfbgt6oSmqZC9MkZkPOCmbP2H65r5yfZbwTZWiYkI/cxqq1/zIT8vKK8PmV6tmseWB
	inSdNpi835AFu8DvqqoCE=
X-Received: by 2002:a05:6000:1acb:b0:437:6fcc:f648 with SMTP id ffacd0b85a97d-4378ac891f6mr930249f8f.53.1770836794238;
        Wed, 11 Feb 2026 11:06:34 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4378e122df9sm211223f8f.15.2026.02.11.11.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:06:33 -0800 (PST)
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
Subject: [PATCH 6/7] arm64: dts: mt8167: Add the mmsys reset bit to reset dsi
Date: Wed, 11 Feb 2026 19:03:27 +0000
Message-ID: <72dcec7fe8bfd8ee7e8ef58708690268f3c07d42.1770836190.git.l.scorcia@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-4933-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-watchdog.org,roeck-us.net,kernel.org,collabora.com,pengutronix.de,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.213.225.232:email,0.213.159.128:email,0.213.206.96:email]
X-Rspamd-Queue-Id: 5E84F127107
X-Rspamd-Action: no action

DSI hardware reset is needed to prevent different settings between
the bootloader and the kernel.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index caf51f203dd3..ee2792d53b2c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8167-clk.h>
 #include <dt-bindings/memory/mt8167-larb-port.h>
 #include <dt-bindings/power/mt8167-power.h>
+#include <dt-bindings/reset/mt8167-resets.h>
 
 #include "mt8167-pinfunc.h"
 
@@ -189,6 +190,7 @@ dsi: dsi@14012000 {
 				 <&mmsys CLK_MM_DSI_DIGITAL>,
 				 <&mipi_tx>;
 			clock-names = "engine", "digital", "hs";
+			resets = <&mmsys MT8167_MMSYS_SW0_RST_B_DISP_DSI0>;
 			phys = <&mipi_tx>;
 			phy-names = "dphy";
 			status = "disabled";
@@ -295,6 +297,7 @@ mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8167-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		smi_common: smi@14017000 {
-- 
2.43.0


