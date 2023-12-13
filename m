Return-Path: <linux-watchdog+bounces-321-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF14811E7D
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 20:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D357EB21095
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 19:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F2167B50;
	Wed, 13 Dec 2023 19:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aAmk6Qiy"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB867DD
	for <linux-watchdog@vger.kernel.org>; Wed, 13 Dec 2023 11:16:19 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40c3fe6c08fso49317155e9.1
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Dec 2023 11:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702494978; x=1703099778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6cP8t0MJYLz6rLmgs8KiUa+iuYrpTNSW6yO1mAwDQo=;
        b=aAmk6Qiyuw/l4cA39z5uk6apf1NNiRP+xHIeb6d5WU93Q2M1eHnBlkYnvZGv/m37m4
         zZTn7f5HysNwo3PJqB6GyqxYfvj9u0vfYZ8OBCulOMD3Qc5YTqqMt3oByorbtXOphkvD
         vNWziLbWICLbGM+ebS5CTmY1teBHc40+5I7njoHo2qLZaMxpIUeh1VqzT6nq39644fbi
         PEpvgGGNRn6gPc/L08tq8dkavo6y/C6AHowwzz8uNYlvDFCV2PhOhTyMRX79Z6JQ0AN/
         4ckWJ0Fs5S21WM2nFV2Oebt/iZSOwfAbB9mv0+7GHuHF3miwezFvVclhuMKX3agXyIB2
         bRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494978; x=1703099778;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6cP8t0MJYLz6rLmgs8KiUa+iuYrpTNSW6yO1mAwDQo=;
        b=wBVA7bE2UZxPjRtTYj/Bdad7wZCgv6zcNcM/j/eP5OBpiqQb5j6lP6wYKNMDcQxzzD
         fFRl03RUmKc8tgnZv9VPaZUaepYBfYA6TwnuNqF9qAbGrDa1r26goNgTb8gZ/GZXlVb1
         Pqph1TdzffuX0gUs7xJqHtcNAq6gAefRXbsy9xG7/FoYQlWVGbubi9bi+dj1t/YsEjz7
         OvM97AxazwxAYYgtSBnIBsvC9ojc/UB8z2rBQaiAlxtJ/LKTk2BKiMkxurfg+z+2F5pK
         2q+qApxwPbdbH2W2qQi8YKeNgED4o7y/G4NXoqVVgEyt8fQzOi/Oxs8OupO9Cz8ZQbda
         AKQA==
X-Gm-Message-State: AOJu0Yx7gdojfuR6pU7jdl1YVleMvwQEJ2ICKe3bcDu1UdzefPxkCYfj
	4vQgc/DC+NRT+jNfFnxXgvf8nA==
X-Google-Smtp-Source: AGHT+IGAL4eUGQ5fQSZsHoZjOQb5ZOk3HVPTsm+ctMmdOqN54tZUoc3cy5SaarClUhXrdXogfPeW6Q==
X-Received: by 2002:a05:600c:512a:b0:40c:317f:3cbf with SMTP id o42-20020a05600c512a00b0040c317f3cbfmr3242790wms.172.1702494978240;
        Wed, 13 Dec 2023 11:16:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id v12-20020a05600c470c00b0040b37f107c4sm20190085wmo.16.2023.12.13.11.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:16:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
 tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
 wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
 soc@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, kernel-team@android.com, 
 linux-serial@vger.kernel.org
In-Reply-To: <20231211162331.435900-3-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <20231211162331.435900-3-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v7 02/16] dt-bindings: arm: google: Add
 bindings for Google ARM platforms
Message-Id: <170249497603.308886.8052027202781573184.b4-ty@linaro.org>
Date: Wed, 13 Dec 2023 20:16:16 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Mon, 11 Dec 2023 16:23:17 +0000, Peter Griffin wrote:
> This introduces bindings and dt-schema for the Google Tensor SoCs.
> Currently just gs101 and pixel 6 are supported.
> 
> 

Applied, thanks!

[02/16] dt-bindings: arm: google: Add bindings for Google ARM platforms
        https://git.kernel.org/krzk/linux/c/b3582328b9c52f179de7fdd7694c42548d416e39

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


