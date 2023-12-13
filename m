Return-Path: <linux-watchdog+bounces-322-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AF6811E87
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 20:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B861028276C
	for <lists+linux-watchdog@lfdr.de>; Wed, 13 Dec 2023 19:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2134E67B66;
	Wed, 13 Dec 2023 19:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="llFfbeTA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70BA0E3
	for <linux-watchdog@vger.kernel.org>; Wed, 13 Dec 2023 11:16:24 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40c38de1ee4so50877215e9.0
        for <linux-watchdog@vger.kernel.org>; Wed, 13 Dec 2023 11:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702494983; x=1703099783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4iug0zFh+mKYBRJSL1NsrTxNd0WHpDbjTaMEVvHOxc=;
        b=llFfbeTA60zc7uJ8kH/OTqKRkBCNf3dLjYsCeTVGTtGu2REu6p+2SbnmGVY5z5sOIA
         vuHXmXSqDBtk2iHFYyx64NrRfeOT1r/xGf9WsCZLfSnBRuQAKsmgaIsofgW55JYxUKiu
         qktv+nUlzx5uMWXccfhL0gSOqW7VN6QXtU1uSLHOkZM+W1DBjhCkfohgMmrgk7O0EvsF
         VfgY4jYUCtASqQeBUizazXVIyU0PHY9AzrXr+FAHGMjiuryehs/E7aEFP0BaxNKzqG2e
         c4tvv2VziWqOKq6jdH8YZkTAHnxtylYMw1AEsdgEDHbcfgpnG4kNzKcOQV5vlqzOlRbW
         bsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494983; x=1703099783;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4iug0zFh+mKYBRJSL1NsrTxNd0WHpDbjTaMEVvHOxc=;
        b=UXCz0ypTVMBiQMCxqm1Ggy/QcvTmxI3trB5W8SVAuu1x+2l9LahQ46+S7lrsndp4VT
         0andBEsUbx1Slsa+1+/fdZDbBD2ysGetvSbL90UtZEoPKiHvldzBSn566V7Iv82Bh5FJ
         sKoGYFLW7CVV0ui5AqKNIEkYfSEljL9gxY5DHULu3VdbaprrnrEtZTjf0W5NiUz4ZGIW
         bla53XDokA8wxGaybjdgTV860zXchB0tl5ODSMLo9lsAtG6JmByOmijf+htCTdAcBSpn
         GBbHLkw9ljhAYI/5s7kDpNDO4105kihOCMaQ5oKLyT8sHEvcCq6XB69Fg6HuT+sWA7cu
         /UvQ==
X-Gm-Message-State: AOJu0Yx1KLmIwIqe0ER/3nYAn5KA4pfy0Q+9ba0sId5Q3Czbtpak2khY
	x68xYI7h3NYHH59Oxf6cfB7QQw==
X-Google-Smtp-Source: AGHT+IGE0R8vQQvj4WfjL/xzOFLRT58TLoAHrMBvInW9ggZ3ojMXxT4TvwW3aE21hn0dgGiWKbIvCw==
X-Received: by 2002:a05:600c:6907:b0:40c:27ae:e5f1 with SMTP id fo7-20020a05600c690700b0040c27aee5f1mr4319869wmb.41.1702494983029;
        Wed, 13 Dec 2023 11:16:23 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id v12-20020a05600c470c00b0040b37f107c4sm20190085wmo.16.2023.12.13.11.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 11:16:22 -0800 (PST)
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
In-Reply-To: <20231211162331.435900-12-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <20231211162331.435900-12-peter.griffin@linaro.org>
Subject: Re: (subset) [PATCH v7 11/16] watchdog: s3c2410_wdt: Update QUIRK
 macros to use BIT macro
Message-Id: <170249498093.308886.1000238484233229719.b4-ty@linaro.org>
Date: Wed, 13 Dec 2023 20:16:20 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Mon, 11 Dec 2023 16:23:26 +0000, Peter Griffin wrote:
> Update the remaining QUIRK macros to use the BIT macro.
> 
> 

Applied, thanks!

[11/16] watchdog: s3c2410_wdt: Update QUIRK macros to use BIT macro
        https://git.kernel.org/krzk/linux/c/d429928dde2d7e3e98cbea5f170d089d10a45c39

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


