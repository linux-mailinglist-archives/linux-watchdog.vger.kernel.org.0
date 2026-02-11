Return-Path: <linux-watchdog+bounces-4926-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MBFKDDTjGm+tgAAu9opvQ
	(envelope-from <linux-watchdog+bounces-4926-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Feb 2026 20:06:24 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ADF127033
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Feb 2026 20:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD2F53003306
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Feb 2026 19:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245FE344DAA;
	Wed, 11 Feb 2026 19:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ek92Vi+k"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21BE303A35
	for <linux-watchdog@vger.kernel.org>; Wed, 11 Feb 2026 19:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770836782; cv=none; b=CidFyiCua8BfvkOe4Q5tnVr0DhOvwuNgBkE4HsZYZMb81Apk8WbQv1T2h7Ht6EobB4xcujLQ6U2n3Ao00cUk4uK9QBR9Y6Ydfw6SYCuhEmy8R+wLPP7oDnbEQQt/++t30Iz429ZOVQBxe6wabQ4s3LQjWG2P3yxopl7uW0Pf1Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770836782; c=relaxed/simple;
	bh=VHwPI7CrsmbjIGlCMPbrgbAn0XZwa2RywVo9XM2/+WQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mOZ4RFZCSVi38tYpOcUFF74lCSLwynpb4RbpYWoFn9aDF51GUev85IfHQPvcDDQjprI0cz5X53+q3IWnJnJ4vlNWNWgWo8peTt7WkMpPiYQSEZyn+a+72sDJlxba2U1xmcS3kSxQa58tc3N5EfQCIDZdJ+WxE+5AAAe7IzrhpCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ek92Vi+k; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48068127f00so23271395e9.3
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Feb 2026 11:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770836779; x=1771441579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xsjpLU/+950UBXEs80H9fBqyvb2ncbcU+NKJQmJQO7M=;
        b=ek92Vi+kiN1dZ0qGzgfNYj1Uc/awQCdbG+cYXCQSJ5duyeqZgINCcQ1OmqiVo/EZ1T
         e2+MEzyWJxmDP5/G9pkflhLooXcaGsaB9oqBVaB7A+/2NhJ14sX6itKoX4JnAZewiaXj
         pWAmxz+LhFThQm418+zgjrCc9fTjR2pEJWOGpQikW78wC0r+tKLeBaOWbtYYb7z6RaBT
         GabW+jyIS2LcbAlqm6k4hmTV6044ttAT5NaNagURRzHLS6nUJdaD/r7mNOql6ieT3CNH
         +3LQeO0Spn5fZ+T/3R5xkj9vbuVcayj6qgEvQZ5kNz9NYD/BZun5R7WVXlQ6R/GXsqRV
         lHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770836779; x=1771441579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsjpLU/+950UBXEs80H9fBqyvb2ncbcU+NKJQmJQO7M=;
        b=kR7rpDT+tm8iw7O9+NRNU67FizYNhzFOj3odDH69MvDTVt7aEv6BdJB+oSDgjU8eCj
         LxEKVFEFJIt/5ObpeN2to0TRjYZjGBWU29Rr37OEPauokc3ZmaqVZipB2NTJkQuqMvll
         l1bdiQQnYi0BxXqg5sqyJOCv4SiyqXsmyZmSOKpOUPJTHfZNf0zfi7XfwMfFqu0QHJQR
         fOXwEcb9RlNRLJNgzATRxWt8PS6o6IIpxeWNxFVdVk0sIwFB9D6hpgElH1WbC1rMVut/
         tiYYEcer6bWyUzGkmor1NuwIeyivUAwYncBm9l1OaTTFZRjonCMyc/jVC2CILVNJMHai
         +Pww==
X-Forwarded-Encrypted: i=1; AJvYcCVjoMzgfvY6Hyl2jNgdsWL5/bw3jSD+1dqK2g76hlvec7pVYjE3SeWefLo5V7lmUX+UTFuo+NTzNRC4AOcZaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPm3PbKJjlr2BAbRuQUh9g9jU0aikciFlmSLMyclRSxEArymQ6
	e5eW/TCFAY6BnySUMsyL+1mZch4btumfNoKzQlCAd6usgRGawlHZh6aB
X-Gm-Gg: AZuq6aKGSPmDCF3dY6ieeXLCB6REjNVGNJJVkRJBBs5jPOmpFzQeyDSAJfdYLDtGQlR
	12OqZnDOafYe9A0KjFr+DGfbtzujlVeP4vp0TmqQXUSMEicP/go/t+2H/6gL1wDjQdrbWJSxiK8
	0bD7CicQQV6RCBckqxuSSfvl940XIj5iSwcFX1EDh9lMWNkj/GT1+IC3scV+rrI02FDDRaeq9c/
	xcznsVMmc6ksArn0xkk2WtGFP2D3Jk9erUPdJNzBMrD+kKbVd3YkXNBE48ynzQvMyCKHn3qqn5Y
	4QYiVnhTEVH4W7OG9CGCRv9Nsbh+r69CGSlKw7/Vd9rsms01iKpOmEgUbl4yPFCCrOpt6uglXBY
	UE9sqIIa/oeJdB/5624QeTit6AMVEvKvG+G2LHlJIBlFddC04C+HqnpRh2XNsllD5MboP3I7ziL
	+HMubQ0QeJtRH8Mb9ntDO2BK7R3MCaZw==
X-Received: by 2002:a05:600c:4e05:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-48365710e44mr2920265e9.22.1770836779068;
        Wed, 11 Feb 2026 11:06:19 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4378e122df9sm211223f8f.15.2026.02.11.11.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:06:18 -0800 (PST)
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
Subject: [PATCH 0/7] arm64: dts: mt8167: Add the mmsys reset bit to reset DSI
Date: Wed, 11 Feb 2026 19:03:21 +0000
Message-ID: <cover.1770836189.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-4926-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-watchdog.org,roeck-us.net,kernel.org,collabora.com,pengutronix.de,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 06ADF127033
X-Rspamd-Action: no action

This series adds support for the MMSYS reset registers for
mt8167 and uses them to trigger DSI reset during mtk-drm probe.
Registers and values are taken from the kernel source code
for the Lenovo Smart Clock and other mt8167 devices.

Luca Leonardo Scorcia (7):
  soc: mediatek: mtk-mmsys: Add resets for mt8167
  dt-bindings: mediatek: Add reset controller constants for mt8167
  watchdog: mediatek: Add support for mt8167 TOPRGU/WDT
  dt-bindings: watchdog: Support MediaTek MT8167 wdt
  arm64: dts: mt8167: Add a specific watchdog dts node
  arm64: dts: mt8167: Add the mmsys reset bit to reset dsi
  arm64: dts: mt8167: Add additional mmsys reset bits

 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 10 ++++
 drivers/soc/mediatek/mt8167-mmsys.h           |  3 ++
 drivers/soc/mediatek/mtk-mmsys.c              |  2 +
 drivers/watchdog/mtk_wdt.c                    |  6 +++
 include/dt-bindings/reset/mt8167-resets.h     | 47 +++++++++++++++++++
 6 files changed, 69 insertions(+)
 create mode 100644 include/dt-bindings/reset/mt8167-resets.h

-- 
2.43.0


