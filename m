Return-Path: <linux-watchdog+bounces-4920-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UK/ROKU1i2myRgAAu9opvQ
	(envelope-from <linux-watchdog+bounces-4920-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Feb 2026 14:41:57 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AC511B51D
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Feb 2026 14:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 289513055DF3
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Feb 2026 13:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A94B329E58;
	Tue, 10 Feb 2026 13:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eM4O8IaT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF99329E43
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Feb 2026 13:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770730737; cv=none; b=SIKc0KKnPqjqx0GThj+VmVwK3T5MdpSrHIPYVvIYtMfCORX/IFrjmen+1CFFw504w089jUZoIq0Es/uC+LPwJodcsUSQarEG5k+E1Hk5Bn50gOy8jeFAHSPI4cxQ/xrzCXp1dT5Mo07Dmuhuo7I1E8Fu1tsKF8VczYPv02fmoc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770730737; c=relaxed/simple;
	bh=RhDCivz4iUY5Is7AELD9+j41N8ME6Dhptm/YMdk+yzM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U/tPTZE3nOWrzyDnLTnGbulKPZrxoJM2coTRIolQltMbkwnlgWu7JPadmftGsdTUCoL4SVlROoAbRC9qFUGdPShjM/pz2sc+kgaig1dQ3b569lKT1/Yw7BCj9I0nR34B9CnhVL20W8Ii3Oz+1ZKBg6LxtIftGWMZt/HEafTBxuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eM4O8IaT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-482f454be5bso56162075e9.0
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Feb 2026 05:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770730734; x=1771335534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3C+qeBfFCnkgIVyeJUvVd06s8dBHvEo1iIcon3aaEiM=;
        b=eM4O8IaTqjb3XvvrW7Vj8YspOH5SvtpU8ZxsvW215zQrK3+d0o/Sfh8gYx5EHYXCwo
         J4h6vIlPoOLLnY7JLN6YfIgcWt+mfr+nHnMH0BfkbKutgrxXK8upD0dOQ+QkfKm8rRrf
         VvXDbLFR9LnIwXhxilcKB75edbJch3WGldveKvaCR+0K+a1GNpfHyaVIMVAb+D7cpTOA
         a0xl9nt6LbZLrycJY3StR69J1kqR3Byi8tQ+S+tcD3MuVbcfykp4RAKSQMLOdbOTneez
         Mf3LYcsDTu+w1UMKXgHS6UwAmCGa0+VpouW0xIGQ9AzFyX7zFO5SsEA1kG38VMbIJbkK
         8Y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770730734; x=1771335534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3C+qeBfFCnkgIVyeJUvVd06s8dBHvEo1iIcon3aaEiM=;
        b=Pumm1RL9mVQOMptm4Q6jyxiv72EmXeUxSLTIjK1tWxeBLs8sCKgGtHuBQGcKHUMkep
         7DrYIuT7EwrK87vUXqzVWL/X6VHz8SG2LXilQzh233XK29HT4CNGGTGFg63DiQCJE9uF
         T9OiepoxR1VuPMbt/oQlUOiC4G6UWfYSOxlVTNLUYdRudR+4N/HxGExLZ3225jfpf2oP
         X6cAWp55/Hszj5XKpwrA6cjIcB3IAlLYa01HpdHweSc2gZud6BuoQ3CAKrsEq385Bs89
         8ylwwZvKaG+VkbsQAmuADqEpbwgk6Au5R8VgpnDqiVrNf5uyfGswC+33ouJ+TqnkPUuz
         rxZw==
X-Forwarded-Encrypted: i=1; AJvYcCWZvhgQ80HNlA/5reVX7+eY30GpzHDW+OZX4dDkNdaPqvTr8TdEO8xPeAUNNmmS5nBEC1A8AZnz7d+AK/bI4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFwy+1Y56+TsAFOcjCMD4rOlzvxt2vQeq69whrPNQ+BB5pxtFX
	WBURgY/obtMyE+xNNUXE40wsx68VRe635m0PFMbaWKc00ixGnGeCyZsk
X-Gm-Gg: AZuq6aJ26uSLBxNW7EE9abe+G7dhw7DfBqvtGbX4MTMNad71UBcxjqmgRQGDofGtubU
	indxKwgWNN76fUwfZwyuGF394ICPCpUFUxkHG4JO61wdOu/ggI2o06U4xSlKSHO7wUtQEwtWtAd
	2ELORRhZUDHPFCQXkbD6+fqP8xrfp7jw9gw5xJblBh5tqYioGvNu/g65yKOl3cLXi7OcX+tsgvp
	FV7TA6jBPKQ0W4t1ARzoZo0Z108BTMjDBqJrnPd4IA3SIC6ChwuDPB5Uc53g9riIipGTtPJ1OBi
	Nz5XFdSvesap2MzRSCLzJ532Tz7S2kXrshrIBC+zbZMwwZZOjVWLTBU88oV10U/qthD08GHP/vk
	xD2G+8lW9P/8rY4xEAVVbDQPnIEeScWEcqbo8zfNNDZlTBwgMlA0Ea+kdxM6zy9nzY1HLWrbw57
	D0z4Ka07ziyLXYzD+KrJuJoxSMFWUi1Ut9MBpJSfsHbVh/
X-Received: by 2002:a05:600c:16d6:b0:47e:e0b3:2437 with SMTP id 5b1f17b1804b1-4834f6cf029mr24422505e9.5.1770730734144;
        Tue, 10 Feb 2026 05:38:54 -0800 (PST)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d8df8sm66773415e9.3.2026.02.10.05.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 05:38:53 -0800 (PST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	avifishman70@gmail.com,
	tali.perry1@gmail.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/2] watchdog: npcm: Add reset status detection support
Date: Tue, 10 Feb 2026 15:38:41 +0200
Message-Id: <20260210133843.1078463-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4920-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[codeconstruct.com.au,gmail.com,linux-watchdog.org,roeck-us.net,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[google.com,jms.id.au,lists.ozlabs.org,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tmaimon77@gmail.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 87AC511B51D
X-Rspamd-Action: no action

This series adds reset status detection support to the NPCM watchdog
driver for both NPCM7XX (Poleg) and NPCM8XX (Arbel) platforms.

Patch 1 updates the device-tree bindings to support reset status
detection on NPCM750 and NPCM8XX platforms. It introduces the
`nuvoton,card-reset-type`, `nuvoton,ext1-reset-type`, and
`nuvoton,ext2-reset-type` properties, and integrates the syscon
interface required for accessing the reset status registers.

Patch 2 implements the watchdog driver changes, including the reset
status detection infrastructure and platform restart support for both
NPCM7XX and NPCM8XX.

Tomer Maimon (2):
  dt-bindings: watchdog: Add NPCM reset status support
  watchdog: npcm: Add reset status support

 .../watchdog/nuvoton,npcm750-wdt.yaml         |  51 +++++++-
 drivers/watchdog/npcm_wdt.c                   | 110 ++++++++++++++++++
 2 files changed, 159 insertions(+), 2 deletions(-)

-- 
2.34.1


