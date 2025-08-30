Return-Path: <linux-watchdog+bounces-4132-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 560BBB3CA0D
	for <lists+linux-watchdog@lfdr.de>; Sat, 30 Aug 2025 12:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28409177D5C
	for <lists+linux-watchdog@lfdr.de>; Sat, 30 Aug 2025 10:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8943274B3B;
	Sat, 30 Aug 2025 10:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="opyLd51d"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991CE26E714
	for <linux-watchdog@vger.kernel.org>; Sat, 30 Aug 2025 10:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756549149; cv=none; b=A76PqMNSHskNdsRw69/WX3FIYBUrjyYmRviEehJfT2GBsycaV2GQVDHHCceywWlblO4yjJM654DEqqWbFzojpGNUTOuaY/l/gpldMFpsv1KtuWrRZ5BthauKGusKok9K3lRjW3Cng02S7mLt97A55Jx7HrnQXzT7YGBGYUDrJMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756549149; c=relaxed/simple;
	bh=mBL3wH8Zv3gv3XD9pXxPdu8BLbNtjAnS1/nt1THHYdU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HJel0eShjlRf7nb6zvbRVg/iK7X3EmqhVRSyP80anUnVpFaqLK3Nuv11NE1xkVjU0W3K55+NgeBBgUjXvH62CImW0k00C7OMVTv77O57qu7hGf9QcsN4WiITDfTcze5we0waH2G40eQcNgUIt4SkF7CmNJmNRgnqk8EyRZApEOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=opyLd51d; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3cd151c38ceso419989f8f.3
        for <linux-watchdog@vger.kernel.org>; Sat, 30 Aug 2025 03:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756549145; x=1757153945; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5sUn7QP2kz00DztPqMuLvh5JhaL5x74fWgbdKmTLlw4=;
        b=opyLd51d+GtF6e8bu2Z6jF8iXcu3Qtrc2PYP53ILlsPusb3RmErsfCCT7p2ihVGB/+
         sG7K0nJ/kQ1bG3L5BQXkfjtc2AmfM33LPMl0xqdiQ/NSZBKbLte8hMFF/9c1ytDFNm9g
         FXlft6xUjRyJXCAqNMiVjQa+0RvRR3LLXBWx/QZs3YmEqfdONVfF0TkBPd0yaQyureGZ
         3v+jfFFu5ZgwZ9+Ar2BCrKIOD9uLOq9dpE6ATm4R93fstT1dMrrQHBVr9URq6GKHDbk5
         QEuFqsl9dKJH0yVR3xoWkl2pZH10NGbdsfCrlTyhxobEPAVgOdBl+g31YFluvJHSP4Rd
         lcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756549145; x=1757153945;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sUn7QP2kz00DztPqMuLvh5JhaL5x74fWgbdKmTLlw4=;
        b=iRubelMst5vip+P7uOe39jQMBqTPJtlojT5meDEwJLvqpH3wunaCxOcodseeJ+JlxX
         txK94LZ/WFTc9RzSvGKEbOix/M4TNlNmyr/kaKI7oMX2xr/wfDnpllhzuCdnJ+cZFgNg
         Z/YNONWBCuxoZLSY9QxfRiyOapoXIFYnbVypAqj532qZgW2xAZZuixJVPIWmPEUrlkzo
         enC/F8BvFx+4sK1AzBjRlYK1LBtKeFtRc6qkZTMk1pg/NvQ8EwF6Hhc02CFhq4+dlU/X
         NxUf0cpu8EDIm2FaGJsyaXsNk/lBqiNYSAPwoMAGyoXxnu2hNwT5yibyFvvbDoTsvYEc
         0qTw==
X-Forwarded-Encrypted: i=1; AJvYcCX2/XjK4qyDvj8m04oQjs/Jqz0BlqS8SYeG84PvT5TzCC59bh/510c0nqBykLsFbjSWFm4vURt/GFB9fBBVFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJY0he0YCAK1iR5wWWyQko02/wHXZHBPs52xdLP7mcvfFBDvXL
	ux0jBWDnwVMOvjFNPPb0kyOW4btAIccvcm6F2m1uA7c3/S2fxFI373P95y1dSHD51UY=
X-Gm-Gg: ASbGncswCmwIbgoJZ+oQKNwuyQaIs8BOkpyxqn1kUItGZDF+hYtrweBy8NTc+FX38Qq
	s69Ty28vwoqFipOyZXIqwVdOUNdKfXjMSpfSLpHY/qn1KThEpFQpQuf+cgWYFKYQtgMqBuLhgkH
	XteyOz2iM+VAQeRjR/Mq6s/wIL5zX+PJ+z5RbvDqzqaW+BbEQoMD71VyUeKWP47jMmx8fzY3qaG
	uya4iot/qWHhfSo7k2YJbWWZzweCWPhu2W8Df/iEOtUFdmoaZZ57Wtwt15YfASxrhcELjnKOMWz
	kwYLWYGbVXKzWs4ebpyvgG17hkZD7r2mds1YGdd4uNi//nHkEUc/qYBb8XJsPCRsJUQUTRHRFZS
	f2xy7Vu0GwF6+Drci8jXfS1TMtoAJHkbGcTffBmvivv3SinaNWA==
X-Google-Smtp-Source: AGHT+IHbvCTcAI6lW9P8ZAuKzeHNMi6YmoSOvGR+3NoZENtf5TPqRuQC7jK7/7r4VeX5isvy0wOxHQ==
X-Received: by 2002:a05:600c:8289:b0:453:7011:fcdb with SMTP id 5b1f17b1804b1-45b81e930bfmr19246945e9.1.1756549144734;
        Sat, 30 Aug 2025 03:19:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf276c8eccsm6547492f8f.20.2025.08.30.03.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 03:19:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] watchdog: s3c2410_wdt: Simplify, cleanup and drop
 S3C2410
Date: Sat, 30 Aug 2025 12:18:56 +0200
Message-Id: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABDQsmgC/x3MTQqAIBBA4avErBswJZCuEi10GmsgLLQ/iO6et
 PwW7z2QOQln6KoHEp+SZY0FTV0BzS5OjDIWg1a6VdYovNxO87hOmA0hLezisSEFp60P1ntNUNI
 tcZD73/bD+37RmBCIZgAAAA==
X-Change-ID: 20250830-watchdog-s3c-cleanup-cfa28bf8bb2c
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=823;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mBL3wH8Zv3gv3XD9pXxPdu8BLbNtjAnS1/nt1THHYdU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostASNGDkfBHqdI8SdUYlxbtH7WC94z0R+uy+A
 mta0ZnarceJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLQEgAKCRDBN2bmhouD
 1yUzEACOf59cQzzBtTDBnQpXT72uFzQBgLc2W63iuHo7n8Z4baF+xyrn3IfvoPv2BnIthmCepvu
 oyNYaxkaA7XirALUW05Cz/y07xi/hqJanb7ZuNWqSZgBA31+V5Za+6iWFcb40Ik5bfBDMYALJb/
 iDPMyE9/20a7onCLRgGmGKhbnxHIXw2RoxZ2l888N2iMnf3/NuZcUVRtnfR/Qz5G2W+FvgejKd0
 9j7gUwxSZ0VCM7LlbBHSW/+1th8Ab8xvcRAnlnRa0/E/xv7usrcQbDtnyqf2xxScVeBjYoOYniG
 cEWMSjCBnUv9xRJb0+vY0W2T/GFXqsoNFaCVNqbMGzU8q/AFDvekCz1R+welxjn7DzeXihYpFF6
 FXKk2BtaYFdtJ7UuV+ID296cy+IsRraPW1llrw/D6iSd22SGT+IL/cCn1qJ0InoQyC1yaHoviZD
 TW/JVxzqS1ggNI/ey2P7ogV7OCWnpFZCeCiRu3Q9yPyQGRasZbXUwV8AoqjqJG9JjYzlU0ohGmj
 dBYSo+BI4/+DU7Mc3wgaBRIXJc6yCt0k3aryAmtxz70PVjfKgjJIl+6gjltG4Jr/v/7kI3bL6aj
 WFokFak9Ri+IneCymYbboyPmhNB0LyKW/7E7AwjdnN4ds3naV8e7J0Fz+L/ph/cz3KNUdEvG3Z2
 N+1dsLyX4sVubZQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

S3C2410 is gone from kernel, so we can drop its support.  Also cleanup
and correct a bit the bindings.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      dt-bindings: watchdog: samsung-wdt: Define cluster constraints top-level
      watchdog: s3c2410_wdt: Drop S3C2410 support
      dt-bindings: watchdog: samsung-wdt: Drop S3C2410
      dt-bindings: watchdog: samsung-wdt: Split if:then: and constrain more

 .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 72 ++++++++++++++++------
 drivers/watchdog/s3c2410_wdt.c                     | 22 +------
 2 files changed, 53 insertions(+), 41 deletions(-)
---
base-commit: 3cace99d63192a7250461b058279a42d91075d0c
change-id: 20250830-watchdog-s3c-cleanup-cfa28bf8bb2c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


