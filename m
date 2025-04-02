Return-Path: <linux-watchdog+bounces-3188-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B301A7926A
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Apr 2025 17:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B706C3B5EB1
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Apr 2025 15:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FAB6186E54;
	Wed,  2 Apr 2025 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RFoiOwtW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6214151985
	for <linux-watchdog@vger.kernel.org>; Wed,  2 Apr 2025 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743608998; cv=none; b=qth5NdhN46KXWQiRfhnfSrAIc2esT9o0ztR1necW34wZNliLFdxLZyzKN7LXSzkdDtTNtlXaVDoL6QFakSUNWWWyN6PKwWsFimg6+4yedVaUTT9QQe2CcgMk2eHGCspK3OqN1F0dHSGD/OkR3rw/tDUI0nrR17UqLvb5KOFwXaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743608998; c=relaxed/simple;
	bh=PasM5YaQBRCOTlF0h7ViV2MKKK4sOojopu+VEkTaWWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u+nPEGNXihU2ZN/DGrvKBOSFFmILsOIhsWSGAx+jyy8NwwUgjGL/M/QJDJwno6BvOFosbaut1881o2LT5XE1yA8BiOKBTH48+ytZSjBq7jaMe20il1VN41oRLGxAB4ecRPBiRXiIpKMDJcdvC2rRLhQdiF5sq3wt6P0/GgIl6PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RFoiOwtW; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394036c0efso47775825e9.2
        for <linux-watchdog@vger.kernel.org>; Wed, 02 Apr 2025 08:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743608993; x=1744213793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Bqn9BbeSUizG/y07EEBC/bR/zNHBJe7SEgbqhMAefw=;
        b=RFoiOwtWknbL9vm1iOEJIzsYvooSv+eLWc5YG9jur2zZ5qevqJ+mECG6PkAklnkeyZ
         ydBbMN49K7x6raYsN7TNBqd9ys+9UKHUxsqzWmhrIe0XYj5gkziiKP118QIWQgzRM4NP
         uKfoYflCr/H+8kWl721RMGJqhIub/sdOIrXpxx/6AmEWuM3JhxlAvmtC9KVKWALL3yDo
         Kn4iRHsB+mHTkn9AWqP67EBNuejiYqlZrrPKIfp6/lJrPNyftl1CQ+sI2uo4MCGtPAK1
         0KVmiJCFQ2+Zev2dZNl5t+vvAcmwryl5idd2jONTF7dfNYgLJQQqtw402aEBMkfd4kZD
         spNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608993; x=1744213793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Bqn9BbeSUizG/y07EEBC/bR/zNHBJe7SEgbqhMAefw=;
        b=PFfhg2KYGiGGirjI5pSH8XJ7mg1xmuONcpB5j4fexrCbybWD9RqqbjH8i0NH31PJME
         ajo3diCC8igVK3F6V2EDvk+gACD1TFdxD/7Nv/T9haONvjCwrtrkN8C/8q+XV8qFUjoG
         me/vxM00gQCTGkuGZu9jWoiQHnZ8L6opt5Fnt6Fih+sJs9FEOts8qOG8OSIgkSC4ziZS
         bWvsafkDmmc9A8cnoxsfBUf4l00b1ORBrmkFPzi44QiMF6RCjg4V1hysxLXXS1rUvIBC
         OBt0H45bRnD5iGPY2Up9s0bBrKtaMBhXGekq2q3CKAAz9ad6I1+kSFz1rDCgjfF1x2oV
         3qyg==
X-Forwarded-Encrypted: i=1; AJvYcCXBmcTbETITe2d8ODzuUjbN1hq2kuaFhoBNjSLubzwQqbS+5PvJc23Xjpz0AW/SIFncEGePSL9Y1fWXdhrzZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3RS035giQXF95nJl2wHw6CJUQqjvnCTanH4jnq5XKwzZImoKD
	hyOoiFTeAX8pl3lyzCIq9+l4H2wMTd1DLqxN55JA6o2w1D6m4x8fZXi0dvFw+JQ=
X-Gm-Gg: ASbGncvzx9imnEmlLOPEreroQpvOKDJ189+7VZ1NaLJlMrRkV1hoZYMd2QF6VqTctwC
	5Xh1Cqc3ZGMKf0iRjEMwj6H55p/BA6dZn5FSM7RXkaprqYgZ1eeAI2+cTy6ZSz+wfuREy8q2ipz
	Duov4JurXdDNiYu4skD9nchyQ80LGzkfVgKUCpZJ4d4LEDF0bdCuzie6aBz9AzmqK7gxgFXlIy9
	LEoZejrKOAEkTXucGwbvxsu90ivhWwS1MJ6jsKj0TCtaeNUd4iWn5ZN74wOkv8FaCntu7tUBnFo
	wuc+abqnJWZwcnQ5bFQ6ws/cvgAHjvxaiP8jul1VmgRysaETf/U3ARRvDlJKbhCv6YSJCb0=
X-Google-Smtp-Source: AGHT+IEZ/EOF+JRXdK+jXCO4XGHidXIrT+gdu+fSLqMc/ZMnNAQHSkb0GwK5dwOyPteuXVEFCqvVHw==
X-Received: by 2002:a05:600c:4f0e:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-43db61b3623mr144309085e9.6.1743608993165;
        Wed, 02 Apr 2025 08:49:53 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fd1194sm24674555e9.11.2025.04.02.08.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:49:52 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	S32@nxp.com,
	ghennadi.procopciuc@nxp.com,
	thomas.fossati@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] Add the NXP S32 Watchdog
Date: Wed,  2 Apr 2025 17:49:38 +0200
Message-ID: <20250402154942.3645283-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NXP S32 watchdog, referenced in the documentation as the Software
Watchdog Timer is actually a hardware watchdog. The system has one
watchdog per core but an assertation does not directly reset the
system as this behavior relies on a particular setup and another
component which is not part of these changes. However the first
watchdog on the system, tied with the Cortex-M4 #0 is a particular
case where it will reset the system directly. This is enough for the
watchdog purpose on Linux.

The watchdog relies on the default timeout described in the device
tree but if another timeout is needed at boot time, it can be changed
with the module parameter.

If the kernel has to service the watchdog in place of the userspace,
it can specify the 'early-enable' option at boot time.

And finally, if starting the watchdog has no wayback then the option
'nowayout' can be also specified in the boot option.

Changelog:

 - v2:

    - Removed debugfs code as considered pointless for a such simple
      driver (Arnd Bergmann)
    - Replaced __raw_readl / __raw_writel by readl and writel (Arnd Bergmann)
    - Reordered alphabetically the headers (Guenter Roeck)
    - Enclosed macro parameter into parenthesis (Guenter Roeck)
    - Fixed checkpatch reported errors (Guenter Roeck)
    - Clarified a ping on a stopped timer does not affect it (Guenter Roeck)
    - Used wdt_is_running() to save an extra IO (Guenter Roeck)
    - Fixed a misleading comment about starting the watchdog at boot time (Guenter Roeck)
    - Replaced allocation size sizeof(struct ...) by sizeof(*var) (Krzysztof Kozlowski)
    - Drop old way of describing the module and use table module device (Krzysztof Kozlowski)
    - Replaced additionalProperties by unevaluatedProperties (Rob Herring)
    - Removed the DT bindings description as it is obvious (Ghennadi Procopciuc)
    - Fixed DT bindings compatible string (Krzysztof Kozlowski)

 - v1: initial posting

Daniel Lezcano (2):
  dt-bindings: watchdog: Add NXP Software Watchdog Timer
  watchdog: Add the Watchdog Timer for the NXP S32 platform

 .../bindings/watchdog/nxp,s32g2-swt.yaml      |  42 +++
 drivers/watchdog/Kconfig                      |   9 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/s32g_wdt.c                   | 313 ++++++++++++++++++
 4 files changed, 365 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/nxp,s32g2-swt.yaml
 create mode 100644 drivers/watchdog/s32g_wdt.c

-- 
2.43.0


