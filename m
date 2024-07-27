Return-Path: <linux-watchdog+bounces-1433-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C5A93DD58
	for <lists+linux-watchdog@lfdr.de>; Sat, 27 Jul 2024 07:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8DC3284F87
	for <lists+linux-watchdog@lfdr.de>; Sat, 27 Jul 2024 05:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12325171D8;
	Sat, 27 Jul 2024 05:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIWAVPUM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAAE17577;
	Sat, 27 Jul 2024 05:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722056923; cv=none; b=atDoAScee5RVpsrJQHJV2YcOr8wSkmpE306fwmHV1RIQR2QJjBnrs1P0lmU/FQdCxhddx+skKmm81MNqJq2a7/rMIAZyYrOkpeGjhdLQfqOZZgINLp8tdSEFSTEhC/VD8faQV+XXE/Hj7PZpxlIGIGghicShEFRejbYYZ3TVc84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722056923; c=relaxed/simple;
	bh=qgUUTF1sFMauq/xgeXZI1G2LtT0PlNVWuIPwYO5B/2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ttooovaeZrlCe2bZ6CVLXu3rSeUt5YygEmkpsB9UQmEq14j+DUeamxN4O+6OuyIitBcJCPNVYpA8uAfl2jpMqDVdyw4Ozuomf0UDr3qo0QVB5zo28zPyRXcIq8rg2X0P/7qHtbYv5CB7z7zdHn4C9ogKkK55MtKczSvf55CGUCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIWAVPUM; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70d2b921cdfso1456483b3a.0;
        Fri, 26 Jul 2024 22:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722056921; x=1722661721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n5MUIjwfPVofvJ7l24V1rvRc5cHOQSx9beaC0wMyp8k=;
        b=fIWAVPUMhIkKdW/IY6GxbyWq3ku2698lc2/acTVbYj8+GjUzrPnS6LYzRXzm1TOOAb
         dPvXJnj5/1v0AON4z2JZcON8M+mrh+6bfeKH6IWWblWGfCqMlCUCYfV5HoB2IR+jC3N3
         TOX1zfPIyZVdBv37XORm4kJ8nmekZWpSkxeGqRcjbQZq4/fuulUZQyU1aOPqni2PBMGy
         EC7h0TBSqf9IayxKsB8wIj2ZNnyCcefA0LqzWHmU2qtoGVcfvGoKXjJH4LcuYS3uF/50
         gFxWIgwjeL3mK3JieiIdkayCsBPMG+6k/1MAqp9KzpBMpjatcnp/khZIe6HV0Ua3WrLy
         kBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722056921; x=1722661721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5MUIjwfPVofvJ7l24V1rvRc5cHOQSx9beaC0wMyp8k=;
        b=Ylrdi1FnTSYRya2iGc+7+W1V9/oIBXLYEkfyjl+4bJDouQc7oi45+SK8b4iLnoB/Gn
         G2N0fF4ugLd1yBzhnCDt/gACpx3mogP5PDgrFGJsom/nsCXU/lo20GrHFz0uGA3LgM6F
         B/y09rYby6436J1mpUwfGYnJ4gRpuoz13NyKnR4B8UqBE6jLPfFCyS60AitBOrAvOY7s
         EBppJBcL5rRWqlwHChXKFr+Ic0NohWSmrikzfeYsOPSkMxUy8XrSLfOD/TewElOKoazT
         fLVXCsxVdLt+UYskv6g4OghG5WohVDkK1slgmAtwZh9cLTdqeOHpGBDVdpMqTOfxdltd
         AvGw==
X-Forwarded-Encrypted: i=1; AJvYcCUKvLWV5dNqeoXNdFimtJQdjHcdj8dI8ebPmc3sMt2StA5+GPBuV1fwiHHfH4wZCjXVypFPM3AGpsurkuSCUzowFj1oxAGerrN0fk72kCMc6ZFTUC3vSryrRwvw9APzNc6SWAMVIQ5maA8rBPI=
X-Gm-Message-State: AOJu0YxWepQmK7RJkBXqckwJdgT8bEbRwE8SV+0WQ2AMvmSY09jlg1pe
	B65Y48yiCVOxs7Qt5CxcMjrVNhe/Sld67ctTzBzZHGLplcxc479i
X-Google-Smtp-Source: AGHT+IEK5h2KvdmvEPmltYeeQRjFuL243ef5mk/88GBjwaGoik1AtOgbbXsBOWheKSG1u7ivmibbrg==
X-Received: by 2002:a05:6a00:14c4:b0:706:a931:20da with SMTP id d2e1a72fcca58-70ece9ebbd6mr2286330b3a.3.1722056920670;
        Fri, 26 Jul 2024 22:08:40 -0700 (PDT)
Received: from kousik.local ([2405:201:c006:380f:4245:58a3:6108:fcf0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead87a372sm3495756b3a.166.2024.07.26.22.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 22:08:40 -0700 (PDT)
From: Kousik Sanagavarapu <five231003@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kousik Sanagavarapu <five231003@gmail.com>
Subject: [PATCH v4 0/2] ti: davinci, keystone: txt to yaml
Date: Sat, 27 Jul 2024 10:34:42 +0530
Message-ID: <20240727050736.4756-1-five231003@gmail.com>
X-Mailer: git-send-email 2.45.2.827.g557ae147e6.dirty
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert txt bindings of DaVinci Timer and DaVinci/Keystone WDT
Controller to dtschema.

v3: https://lore.kernel.org/linux-devicetree/20240726150537.6873-1-five231003@gmail.com/

Changes since v3:
- No changes in 1/2.
- Explain why "power-domians" is needed in the commit msg and also add
  the Reviewed-by tag.

v2: https://lore.kernel.org/linux-devicetree/20240725153711.16101-1-five231003@gmail.com/

Changes since v2:
- Add Reviewed-by tag on 1/2.

- Change the compatible to match the DTS on 2/2 and also mention in the
  commit msg that we are adding "power-domins" as an extra optional
  property, which was missing in txt binding.

v1: https://lore.kernel.org/linux-devicetree/20240721170840.15569-1-five231003@gmail.com/

Changes vs v1:
- Change davinci timer binding's file name to match with the compatible.
  Also add "maxItems" for interrupts.

- Change the order of compatibles in wdt controller bindings touched in
  order to match DTS.

- Drop 3/3 from v1 which might effect users and should not have been
  included in this series in the first place.

Kousik Sanagavarapu (2):
  dt-bindings: timer: ti,davinci-timer: convert to dtschema
  dt-bindings: watchdog: ti,davinci-wdt: convert to dtschema

 .../bindings/timer/ti,da830-timer.yaml        | 68 +++++++++++++++++++
 .../bindings/timer/ti,davinci-timer.txt       | 37 ----------
 .../bindings/watchdog/davinci-wdt.txt         | 24 -------
 .../bindings/watchdog/ti,davinci-wdt.yaml     | 55 +++++++++++++++
 4 files changed, 123 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/ti,da830-timer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/ti,davinci-timer.txt
 delete mode 100644 Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/ti,davinci-wdt.yaml

-- 
2.45.2.827.g557ae147e6.dirty


