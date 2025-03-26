Return-Path: <linux-watchdog+bounces-3144-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50635A71298
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Mar 2025 09:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFF521899052
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Mar 2025 08:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8692AEE0;
	Wed, 26 Mar 2025 08:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFtWK8Xb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56151CA81;
	Wed, 26 Mar 2025 08:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742977830; cv=none; b=kjUBYnuVV54yC3PiSSFg+9gJY51a8CfdeAj6FV3t6AURnDbXF/OD7kBe0aywXwMUuVzGa6X287MsV8QoSZXM/ljfi7vLK4Iay82TSAq2NeGxrQC3/tmoGwgabQCEuanXurdm2g+HzKH6GZ6p/+KqnOXMiP37UQ+JxZ/r5GYKPPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742977830; c=relaxed/simple;
	bh=j27phBDv2hRyEhTdTaZx0+QLYgH+5k/3JqR/QJLxNC4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BfZs4Ql+swN0mKTvqc/kUSQmRLp6ggxghrr7iahJLzApu/aDO55nuZyx4GqNg6noUeFdGt4/ATTyMz7/5zjyA9XZyJWFNtiqYEkLHc49TSztAjdxmVmU4xTHEKq/W/wXdKx/sgbQQTTt7wkx3Pc0PCtEFks6vC9KcX/fSnNsGwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFtWK8Xb; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so7399998e87.1;
        Wed, 26 Mar 2025 01:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742977826; x=1743582626; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8jHTge61ST3OPwWreZnQQIjY8kJpk+sNiYKMbeXyufY=;
        b=gFtWK8XbBHM5DrczQmhP3q4c94iHJmXmJtTypj4wVNbaPLtl0oYNaLeymUPtpsBskx
         AKkM107xhqD7zjrLhD38U7xZt7bG0PVUtVFJvPwBU1DErA+oGwaeZOlKHaP8v2NlNozP
         S2hQxVYt4YdrhmwJkij0PgVIpHrvlNHRSzEPjVOMFDF/qH6g6Y7EsJZ2qP9kXpmXZRh2
         5jAvS5RE6dBT1KcEn7hxfkPG9q9Qvj5ODy8nMFSoNLsqgnKAQfz0Z54XkGz74zVamj2t
         b/WH33HDx6phZhkRt7DoPvm7gPbMrTk1VmmXxa1wir/boUZ9n1DHpWBk6ZJF8ml0nsZg
         3QIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742977826; x=1743582626;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jHTge61ST3OPwWreZnQQIjY8kJpk+sNiYKMbeXyufY=;
        b=CMIN02ko/gsA/eYoMZJ9pltMOBJa10SrZcKG/mbMkjnMt80SI67KZ65A5OQb7XcBdo
         IWi6vblvwD3OqLWi3mknjQqjvvc0W9A0JbBc9t5q168nLwKmjcCul/F1euaI+Sb+1bBw
         nBAKxputjez/60AL+H2SMeZJaPtXKE3ED95+aPGCXFGA2O8HsdWXhYm9ysFMn4T7hsJ8
         YDaBjNAFoCTyHbQsneYqlFy4CZbZmJdujUqwBGl23raqwIAvAqdn+XLKqrM8zjl5ucff
         AgOCH/aCzC/a1qK3B4Z7WonzFNMcKtnMPYXJAur2Y35nhHYzAXkcNljJLX8ooDxC8Omw
         To7w==
X-Forwarded-Encrypted: i=1; AJvYcCVBGGkWTNMorhn4fW+pY4V4zNtmD+GCgSriGhyfUO8PQqPocS9snkjHchiQ+ag0G1VQ7GGXkJX+beEabvg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVJo6e+AMWcnO/ECGmvVR/hTdm+qRH2wPr5rb+LRjUue1lqQPK
	ynLULFHOhZXX3nuXByvVMr0bBz7qfBm+rjRPlv7Vx7zEWPGKCosSC7ZFFi4P
X-Gm-Gg: ASbGncuMtVpQOT6p08T2eRlVy0lPuPN4xtJd38cl2M/ZmgshuXSvqlBiObygRyDw75b
	rRmaAG8d+HAGvNx8S5Vwp0D7MC7EHgvZMnctQr2b3dMUFagA5og9VRGvZ2gxkrqd/5J2R1yIrxy
	Knlq4kdJcKRkHGib7nchXZJKauVGbV/7CJwUmTlqRHrm7XxQK6QMSHOgpJE5nOS1N34ofax9ts9
	Q8ZGY2bJXDGG/wgxRCe67OcZ0p8rsELZa+DT7wVHb22PRlD+ySluApmi6JGclO2DbP2P8b6sz58
	djKSELyYCJcsVy6mGLCglcN4B0pFdTt+wy5gKU2DctysaRw1AM4IC2y7PdNENVNAjB6msxnL0Xx
	G/ij6mK7FxtTc
X-Google-Smtp-Source: AGHT+IH+3cuZwFi+t8kGvVWO7IlHptQvbj9bcs9MFTnx4+CbvWDaTl7X74OVK1515osqKpV5mqB+/w==
X-Received: by 2002:a05:6512:1314:b0:54a:cbfb:b62e with SMTP id 2adb3069b0e04-54ad64f6791mr7564620e87.35.1742977825995;
        Wed, 26 Mar 2025 01:30:25 -0700 (PDT)
Received: from [192.168.2.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647c6f2sm1707406e87.79.2025.03.26.01.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 01:30:24 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v3 0/4] Various fixes for the da9052 watchdog
Date: Wed, 26 Mar 2025 09:29:47 +0100
Message-Id: <20250326-da9052-fixes-v3-0-a38a560fef0e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPu642cC/3XMQQ6DIBCF4asY1qUBBkS66j2aLhBBJ6naQEPaG
 O9edGWadPlm8v0LST6iT+RSLST6jAnnqQw4VcQNduo9xa5sIphQDDjQzhqmBA349onypq61bEE
 aA6SQZ/T7o4jbvewB02uOn72e+Xb9E8qcMgradK7RNhgF1360+Di7eSRbKIsDFuoHi4LbYB0Ep
 ltp5RGv6/oFFwsCg+UAAAA=
X-Change-ID: 20250313-da9052-fixes-186674b34993
To: Support Opensource <support.opensource@diasemi.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1274;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=j27phBDv2hRyEhTdTaZx0+QLYgH+5k/3JqR/QJLxNC4=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn47sEG8XCPAHKSvgmNGseJD+rii1jdP+sBb485
 Q9hDO1I5GuJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+O7BAAKCRCIgE5vWV1S
 Mq3JD/9PTL9/JVBCPaAHxRyYfA+OYlPhy+b26ihXbpJmb1vY189yhkyVoSPLb1MjGBFH8SHbU/h
 CVAqAOMny5/O0mwo0qfgQT8/lQqcgF8WzIQqJQcs12QrgflIWyNztCntO0nTjQUaftlTjiM7y1U
 zKpyz9l9kTszVic/VbE5oLrPIxyRdxdFwz9efvZWSVPO+oT/EtCj7fa1qW0y3Pzs34HyPxVjNUn
 eJdAXCbw8NXQpQ9/rEZmYKSvL0sL5pDD8oXBTyy1uO8yquzIuYcoGZk5zI9YnBERuu1HFjHuVrl
 KQ76UAyg/ogchfki+5fdDWhjEmqokv8E8Cs+vIEG6rM1cYjYL65iYmaLpebdl81ka0sa+EWMcZx
 abQqcPpr1EvpSmbmr/AqI0ZBhcHJCpxA/WYNosd7m/NEz/mkTrYKmCDqGndkqGRQJ9OdnrWleIr
 6kbd33s+VggK3zMrQvFsNRveE9BlUKFBSfkmXdR6NJRQ93BryvCRN/dPV+mp4/LnUhk3fTMD2NB
 BrW6ofF9Lz+oxMrJuYn/gnAeau28hoPi/A35Ia0N55RaAV9/DGAfaz5tWjEb7/zo9J70LebaIBC
 jSPaSO/u+4aBHSrcLvWp56WqgOxbG6dm7EpjtDLmfxUHczWPeJH/y1XjAxLbqyS2+vQRmcBt05R
 EeBBz+ARjMjQzcQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Add support for the nowayout and timeout module parameters and treat
them in a standard way.

Respect twdmin, without this the watchdog timer will immediately assert
TWD_ERROR and power down to reset mode.

Do not stop the watchdog during probe. If the watchdog is enabled in the
bootloader, it should propably supposed to stay on.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v3:
- Set WDOG_HW_RUNNING if the watchdog is left running.
- Link to v2: https://lore.kernel.org/r/20250325-da9052-fixes-v2-0-bfac3f07b4a4@gmail.com

Changes in v2:
- Fix warning found by kernel test robot
- Link to v1: https://lore.kernel.org/r/20250313-da9052-fixes-v1-0-379dc87af953@gmail.com

---
Marcus Folkesson (4):
      watchdog: da9052_wdt: add support for nowayout
      watchdog: da9052_wdt: use timeout value from external inputs
      watchdog: da9052_wdt: do not disable wdt during probe
      watchdog: da9052_wdt: respect TWDMIN

 drivers/watchdog/da9052_wdt.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)
---
base-commit: 0fed89a961ea851945d23cc35beb59d6e56c0964
change-id: 20250313-da9052-fixes-186674b34993

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


