Return-Path: <linux-watchdog+bounces-3129-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3509A6EA74
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Mar 2025 08:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CDF91891EE3
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Mar 2025 07:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D4D1FE471;
	Tue, 25 Mar 2025 07:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqluXcpZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D869A14EC46;
	Tue, 25 Mar 2025 07:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742887666; cv=none; b=i0SF2pQgpokGcjKDYxf/BcsVZUdjXou6Ip0tWdyg/Dc5s4PpEDtZPSBGOqJ532nXcJb49WEKEKeqefntxj1lGtFOzZ0FIulNkg8l4xPxTLNBR57lKUCJLmzb5AhbY1cPHQlCavORBmW7QRSB+ja8ZshsOQyZjv+Jwo1pyIl0RXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742887666; c=relaxed/simple;
	bh=vDZjMDRfpIWiVV0aSXOU+kW1WUREJ8hxHFE4R9JrT6U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=F4TO4iUw6m8pNwhwIfCKWUxSY9xaCyy2ST1CPd6P7CVsqPpUbB9BygX6SVPkVlFdqqOIEFSf2cf4GuljK0ftiWUyWoXXd7ve5qhg8uIw9Yfr5R6pdcybQy1a7QePhpjP+toc312DSqZ6g7dGNjv5BJtCOqQeyWg6/u3CyoNxjP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqluXcpZ; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30bf5d7d107so44124281fa.2;
        Tue, 25 Mar 2025 00:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742887663; x=1743492463; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m9tWabLN/oOXbS0p5O3pA+2F9VFFmwTF6H81jPPhkBM=;
        b=FqluXcpZGIYtq8tfjGnUp2f8diy1UE5iVsNLrLMVgCuBk6bE7DgsM28qOL5DmMjsg8
         bSksDVotHvFLsX+i2AHQn4mvWTnIvUxexImV84a7poeaxGpj2dyaxBrYKO4yYWjg63Gr
         hKBuqnEZOT1gqPGCD5+Ds2byprdwu5YdU6UspqUgoQfPakQmmh5tBzhoIaUJ5KA2rie1
         21bYMrdvLYF1a7rNCHj4sFUe9cl2my+L8r78zOTGFHyl45cDAaTLj+3wE5qDBkR9wpYO
         im7Cn09rSqXROc6P4ckBbr486FZ486B46oo9kk6o8LmH8LhSo8FXcysJygwCEXDyjhp9
         GFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742887663; x=1743492463;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9tWabLN/oOXbS0p5O3pA+2F9VFFmwTF6H81jPPhkBM=;
        b=JNGze6HHMR4Z5V6oBVyf3sZQlbkAbfBPPdGRWuSCCXQ79xy+LvPSNljw0QqmjuUN5x
         OPMOX/+hfScThMNzud9o2nrZUJcwvrAf0Yqb6LwQI+3WTGOTtCGqE0QIvsUWwXEZyccA
         S2hRqNGMH2FPhVs3TdmWO0jMzxpE9BV/a0XqCA0c6r+kuGSEYH0G1AJZbsgfS4uXpvtG
         yuYTq8kMlIq8LF34pZ4nf4MiUB9z9JG/FujgTwi1x0619BkJw19dbapBe+EYASvVd0AE
         +oeuXYlyC6sx2WCmUn/yKLSr4+13PjdqNRntQpWkprluvt+4MtncZulTkKLv5V0mM9/G
         nJog==
X-Forwarded-Encrypted: i=1; AJvYcCUKWJraN9NcSS5FIKD84ZO7KCrRnc7T4dRkd+qdPKBIhnoALmIH7cVcwLywwwoJFdWX4UrQ5zKeE0/qKiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd3Lc71kjPIzrYe4S133WCXH1HY0puBcUxl4O8Xbg1Zd22nciW
	edo+tLaNG20foOgCtJo3/jhtfuuF65Ujjuy8oTbbB9Xg5fd96q5S
X-Gm-Gg: ASbGnctZp6sP+HHIelYBIHB3+F+d3vClHjE7pDyrOSSkr5CGsoNFz6Go6w7FqtoHAA8
	foztsnfhYArBMCbts6WlOCRHzQyLN17pgxeMN3Vd3+Tw9ZOhUYAFKqu/x1OH+S8UV4CeghvAzzh
	2o2hnKuxxr/m0FZHJjsBeGE4TAxUafwyHfflRedHOE+SWCmLQGPiWrfyefFCO9iagxWYML0SFZV
	fPnqOVask2Sv7m4Q2igMgtB98+Gg9UyT0T7fZt72E1BurV2kcSxdaAcwGTz+9sUqZfJtKzq+Hmz
	MNytYgaWS4xX2qt0zPFvpy2sJ1+tjV+QTbsepbLJaC3Nw7ApYwt98QUaCKbEOUd4bVERRX+ORT/
	HZBpvvaTGTRrd
X-Google-Smtp-Source: AGHT+IEFAKLOVvQR99VNsKiRcwaZjRcb2nYfKuYBL2Jc9Gp0J6U0HpqBZOjmwznhx9PC3H6FkDevFw==
X-Received: by 2002:a2e:b8cc:0:b0:30d:7c85:14f5 with SMTP id 38308e7fff4ca-30d7e28bdeemr72855521fa.25.1742887662390;
        Tue, 25 Mar 2025 00:27:42 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d89661aa3sm14307621fa.31.2025.03.25.00.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 00:27:40 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v2 0/4] Various fixes for the da9052 watchdog
Date: Tue, 25 Mar 2025 08:27:11 +0100
Message-Id: <20250325-da9052-fixes-v2-0-bfac3f07b4a4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM9a4mcC/3WMwQ7CIBAFf6XZsxhgSyme/A/TA1LabmKLAUM0D
 f8u9u5x3svMDslH8gkuzQ7RZ0oUtgry1IBb7DZ7RmNlkFwqjgLZaA1Xkk309omJvut0e8fWGIS
 qPKM/jmrchsoLpVeIn6OexW/9E8qCcYbajK7XdjIKr/Nq6XF2YYWhlPIFMBPKyqgAAAA=
X-Change-ID: 20250313-da9052-fixes-186674b34993
To: Support Opensource <support.opensource@diasemi.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1105;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=vDZjMDRfpIWiVV0aSXOU+kW1WUREJ8hxHFE4R9JrT6U=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn4lrQsWZ9RIH88sXC5PBI/Z3nub4lLQPqBPj/Z
 a2bzf85kq6JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+Ja0AAKCRCIgE5vWV1S
 MozoEAC40QaOnzm18/q+IUCRwO1Ki+kNSbkaSKoqAqO2NWDblKGEy73wErdElHOjrgMPQR1ABLt
 nJNutMv1C6a48HKRWOG8mPG3cmKPCojTUd8XTPebOENG12GTvdTlUXfx/TTWFNCI+TDxiSX1DHZ
 JVZZcwd1z66qOEexu/dAAIud5mCmPxe11QG058OqSsIlAk12z+H7XXFX505WF5apJ3UscAovXo+
 5sRlJenPz1vBGnnxouhozL3hPMgFTccB4So6ri7sqKObiKFxYqrkXRp2/EcPnSwam5if9JHwFzA
 F6ORbxaLsVQFPd9rNcovGVsa+T5MUYatzhA+Yzi4kL1bwy4F2YmsMoY3m0MnglYMKfGZpDqzMD7
 Y+3aqwfvWFqLKIC8yKBrCbe+kNd7EP0dmQpAihA7OAdg4sRQ/4RSWKo3X38dZPDBiBF6VW9jxhz
 1gPJHDGPcKv3Wy50RwceRB837qH8+lEGLvX9r68o/Zq5LQAj1/bDZbaOjAxVrbd0BI21XtEM7Vp
 ztBmDAysx6DD85KVc2RPnt+rap7LEatgw5tyhMC6usJGLyKmANbc4Jm9H52m47On+VF4e96BuYL
 ZWi+DRZ+Panef7rKhCsRCpC/0dRRqibfGLmCryPK2dj0VDFmTbsTEDzxllG/nuUfbbmUqKusw3D
 Uc/vNthgDilqBzg==
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
Changes in v2:
- Fix warning found by kernel test robot
- Link to v1: https://lore.kernel.org/r/20250313-da9052-fixes-v1-0-379dc87af953@gmail.com

---
Marcus Folkesson (4):
      watchdog: da9052_wdt: add support for nowayout
      watchdog: da9052_wdt: use timeout value from external inputs
      watchdog: da9052_wdt: do not disable wdt during probe
      watchdog: da9052_wdt: respect TWDMIN

 drivers/watchdog/da9052_wdt.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)
---
base-commit: 0fed89a961ea851945d23cc35beb59d6e56c0964
change-id: 20250313-da9052-fixes-186674b34993

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


