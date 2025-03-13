Return-Path: <linux-watchdog+bounces-3096-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 860B1A5F3F7
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Mar 2025 13:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 613EC18925AF
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Mar 2025 12:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517EF1EF0AC;
	Thu, 13 Mar 2025 12:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzIpbcZ8"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E7217E;
	Thu, 13 Mar 2025 12:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741868122; cv=none; b=Ag9cKGApg3Pj/cD93KKSBJyb1vIVu0sw4Wa/ysCIC+lM+Gvw/f3/Cf0dxCoVLh8eHRxxKn9Yb6o7sLGvaqEup6o1cpVjc4CLjiPIFcM6JfglDVPpMnCeKsK35jEEkq77nvEOe/+m7TLtB9z3u94dyVwIAvierw3oyQN8i7vFTKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741868122; c=relaxed/simple;
	bh=g56cwqF2XxaeXv2xKchsdULMeH1UcKRRoB2nhPi2xpk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=siBnl6Ex8hmsMM4li8H2gjQao00zJAGoHkRJzsf0I0BgBFOLKKZ/TSsc8xZdVgPzVpqJ5rqlJbIfF3P1G/oy1ZGIq4PdXZwocwJV02XXniZ8fUZxI/vtujKe6Zul9kY9dEjpHpqAMo7Q6uuSvgVShwWs462Vln+1eeX8Qjuc6hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzIpbcZ8; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-543d8badc30so1033980e87.0;
        Thu, 13 Mar 2025 05:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741868116; x=1742472916; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLpXc0x6teHn8Vq0V3RlIHJu6xTX1oY9hJxW8E9iUDE=;
        b=hzIpbcZ8dubp/PqzMCwEMUTsv5Hkdx7RyH4v0a/J5JEwuI3/AU9CJQcCDpXzhrZi/g
         K0U4MAPxx+sgIkcrAFvqb1OGDBB4X0O3znyUW3CjQZz0snTkuTo3AZ2m+s7Ec8+lG9Vj
         o7vkIeI1hRtie7NqDSRSveP7HrqySs8Zjs3lqkUwZhjMG9udUVo+r5KPhRMto6k4bUsV
         dhaMg7b1onZ4xsNc90iyVKbiC1BFeFPeHNYmvzy0zN567qjtz7PTWV58BPWfs10tubYY
         5ZlvvUBFxCVf8ZATAc3rFPYiKeO28c5BesJbZgsKrQzMyr3HuyrGtRVfx8F8FBHKHL7j
         PoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741868116; x=1742472916;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLpXc0x6teHn8Vq0V3RlIHJu6xTX1oY9hJxW8E9iUDE=;
        b=W8Z/MP0K6lWq2VqqJI0aEz/0qKg0qlgW4maaGa2gPmXscfrA/6kN4Fk7yvaXM52F/V
         bsWBUrHJZxvVgycQuZNQISKMawSdjeNVzmXsmPW3gevGYShzGXIZ0JJr9+aHijiX+JdJ
         0WIbumFxiR8MiFmWzK4fzIe2mhKxNAA/gc+Dv80jVLdRzSRC5gnATuo0VqtTTPYI/TpW
         XvVerNZ01TkVZmawEv8vULXUOy4yw2pZMGiTP+xPKDFJT+xLPctRLEuitw6CcyrqsSLd
         8YMy7Xs2tLscnuIhAtYlmnD6I3IvNQHw8kl4BY7IaCZz0gX9yBo65UhvO17Wsk0ggg7t
         offg==
X-Forwarded-Encrypted: i=1; AJvYcCV9BaRnUV2esioeeRB1oVhnrvEMPh9GFfRxn5H82UePOkvDOkKZdHTJeQbppahGYV9j64sNZ1CB6rPDyMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW6bN6qLfGI2V5Qx3qxAZL10GDNwStNr9sukOHUsytDSX9FF/T
	g1cpekrj9dMLU/RGkxtrIef508dCcb2q+zgL5SXsssz3+XIXyEsDw8yuL9Cw
X-Gm-Gg: ASbGncv0JgP12PQATFFACjoCO8yxD1hI0J/GLuFXWeEDO9Vk3GUgMJCu+BVfkE2+EWS
	eo48qVVT7GreZGBJaRZOIXUJPLUKJfKewoMaeJt1vFKQhWxMj2qoJFJ3HQMDF17/Qe370KhvNHS
	rHXgcozFIybXiHXaQRVT+hZ+4e/7uCdyzafw+qwln9fV0NV1gb4omKMIfLSawky56V9a2glxPU4
	aLQhV3DwyKhz/ULkgTf1TQ8hpLJ/wigpZRQetEFi9cof/VPTMKNTN1GhfXU7Mu2VucWixfEPSe1
	ZN7Eax8zjeVXk06cC7n2oR3qAXWcmZEoAAE6hyK5iRIsr+7aV9OqGdPV6xz4JChNYAXFlMcJxk/
	KTag0c/xfvkyt
X-Google-Smtp-Source: AGHT+IHb7J0L1Oc7lBCebhNmK7tyQZr/iPWfsJpGR8yy0VQ8mndcbgDRPrZMTgFBg/BzSQoZrW7QJQ==
X-Received: by 2002:a05:6512:1598:b0:549:8d67:c48e with SMTP id 2adb3069b0e04-54990e673a2mr7892431e87.29.1741868116239;
        Thu, 13 Mar 2025 05:15:16 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7c192bsm192851e87.89.2025.03.13.05.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:15:15 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH 0/4] Various fixes for the da9052 watchdog
Date: Thu, 13 Mar 2025 13:14:40 +0100
Message-Id: <20250313-da9052-fixes-v1-0-379dc87af953@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADDM0mcC/x3LTQqAIBBA4avErBP8L7tKtLCcajYWChGId09af
 jxegYyJMMPUFUj4UKYrNoi+g+308UBGoRkkl4YroVjwjhvJdnoxMzFaO+hVaecUtOVO+Id2zEu
 tH8te5C1eAAAA
X-Change-ID: 20250313-da9052-fixes-186674b34993
To: Support Opensource <support.opensource@diasemi.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=948;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=g56cwqF2XxaeXv2xKchsdULMeH1UcKRRoB2nhPi2xpk=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn0sw4/hLuC+vLM59v+G8DAYeSBtx7PQgdNBlBJ
 NrkViVHpAaJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ9LMOAAKCRCIgE5vWV1S
 MvONEAClwECQDkeeLAW7y/8XlKh9JHefoqwQgNIpaeFUQSmSBkD1zOafib1Adlquq26XCl3Wzit
 Wv1/tGMXn7/kTNzP43qa5JypSAftHMYDZrdaHnGyp2OCFUI4cUK15O8oYvbdSOaMO+sZmM3Gvlc
 MmIWzkwf9E9Doe5buVkRQ8sok4czniyj/3vQjnR2lQzmRdiUdeVHyvw2CwldLE7b7E+6mrPaQ0k
 TKyPgdoMojQY3l1hTt5q96cQSsL3+f7GLZWBV/WqE6x5GrPjWXNF5gCAQzlvKZEbbVTuCxVTdwa
 IXYhtIpZlvlReYBIvBh4SuMA4/ogY9Wy6K9nNCchx14yKL8P4FPZK3nLmg3Dn5vE/b5HVTg6bP+
 FlMD9ONVqvME6DdmQRcq2B39ylWV9p9hNTiONb5vsZDPBNmrrWPtr8mUMSDjiBVt6WrELXqaLw9
 oERqjrJ96SDutj4CAMqsVA2rEQ9kDOPi3RLVR0PgVHx30cpr4GtaZZNtPiwD93QOqYp3sOg1bJN
 og44EDEOeHtkePkfRALhJPIhWLtk9a4jYGyp2WOjcaf6DM9bWH3UzIZYYCP8eqLIV2WpxnQZ64Q
 xXMM8tMze9dGjCksgqT0QM1Ge8jfYRUNor2DaA420jSTHR4Ip1/WWs1AMHN+mNLtp+0mJsdpOK1
 5oLYPmzgnyjGagA==
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
Marcus Folkesson (4):
      watchdog: da9052_wdt: add support for nowayout
      watchdog: da9052_wdt: use timeout value from external inputs
      watchdog: da9052_wdt: do not disable wdt during probe
      watchdog: da9052_wdt: respect TWDMIN

 drivers/watchdog/da9052_wdt.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)
---
base-commit: 0fed89a961ea851945d23cc35beb59d6e56c0964
change-id: 20250313-da9052-fixes-186674b34993

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


