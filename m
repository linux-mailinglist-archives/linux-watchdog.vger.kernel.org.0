Return-Path: <linux-watchdog+bounces-228-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C1F80C589
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Dec 2023 11:04:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4C8C1C20DA6
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Dec 2023 10:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1969822083;
	Mon, 11 Dec 2023 10:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ofjlzc+I"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADBDEC5
	for <linux-watchdog@vger.kernel.org>; Mon, 11 Dec 2023 02:04:32 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50c02628291so4382527e87.0
        for <linux-watchdog@vger.kernel.org>; Mon, 11 Dec 2023 02:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702289071; x=1702893871; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dlDvMrT1asX8DIwxy4hQXmmKRl2/sfivmPuoV3hSf5Y=;
        b=Ofjlzc+IYU3NHmDDtIL2zWKs67vl0PQVAs6jeVULRuQRbcwliyan9JKwqUVdgNTMGg
         D2M2hI/NRKkowtsBCAsTQ1LRSVR5CUhdsZdkAqjWyZwML/DAJjNuwJzccWzOihCxWFZe
         3cz/SrQ2YHCustJKFKLl2Yf+HkOGr5se7nuCnsXmGjBccgyWwxoZPVdUG9t2OyPVpU4d
         kOmdWbuzd4Bi+0ZZJNEPId81uDF0Yetxz4FjVWbMBzowgE7SsQSGPl7q244Oy5Hm7FCy
         YriGIk4uICEzqV7MYKIKc8BXFc/9KMFy7BJEy0oXuXZrJxL6UybDlv9oxsDpmt+0VjNG
         ynFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702289071; x=1702893871;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dlDvMrT1asX8DIwxy4hQXmmKRl2/sfivmPuoV3hSf5Y=;
        b=eWUQEy3FAnpF3so8ygvBWGgHuEzy3LvRSxxgnzvk8/DeMdPvMeEVZI/RqryzpixFQ1
         IosRo7UNjfy42D0H8+MGPbYPzwwunxyfg0xOROLPQSclEnlHW76uxA+ZekTxGuOZMbTp
         3ytM1KxDi9IXX7MZ5Gxl/Cu9QKiGIqnBQH19tRp6gd7wsoYDjU2hm37/lCDkpVSSUr9v
         xY1DewMlm5e8kecQCzXMn0Wl/W9Lid/dppk6aBtp12S7SORGcA5E/vif3OJMsC1roykC
         vAeGKrfhkpRI38zea72Cm/ovsnzBWW6j+BuljAvrlTpuVbMCMextUdcjk9IcovwXq8Dq
         wfYQ==
X-Gm-Message-State: AOJu0Yw5NKQtjCPSYwC6+HP5rBvvjgYeScDhnTqufXImeIZuPPV6Cbjq
	sAwdjur+BEaSLHjkkHrXUTKx+w==
X-Google-Smtp-Source: AGHT+IGE0CAwP4QDiJnNgqtN7eWwZHyt1mgacPdvwANjL6HNlCW8mOl+VpfcTEOzlnLHL9+YpJ2Ucw==
X-Received: by 2002:ac2:58d8:0:b0:50b:f05b:7c22 with SMTP id u24-20020ac258d8000000b0050bf05b7c22mr1538255lfo.53.1702289070940;
        Mon, 11 Dec 2023 02:04:30 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id fs27-20020a05600c3f9b00b0040b36050f1bsm12147315wmb.44.2023.12.11.02.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 02:04:30 -0800 (PST)
Message-ID: <0c8532d2bcb6ad5a583e8f716cc88cd5cbae1356.camel@linaro.org>
Subject: Re: [PATCH v6 12/20] clk: samsung: clk-gs101: Add cmu_top, cmu_misc
 and cmu_apm support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 conor+dt@kernel.org,  sboyd@kernel.org, tomasz.figa@gmail.com,
 s.nawrocki@samsung.com,  linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net,  catalin.marinas@arm.com, will@kernel.org,
 arnd@arndb.de, olof@lixom.net,  gregkh@linuxfoundation.org,
 jirislaby@kernel.org, cw00.choi@samsung.com,  alim.akhtar@samsung.com
Cc: tudor.ambarus@linaro.org, semen.protsenko@linaro.org,
 saravanak@google.com,  willmcvicker@google.com, soc@kernel.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,  linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org,  linux-watchdog@vger.kernel.org,
 kernel-team@android.com,  linux-serial@vger.kernel.org
Date: Mon, 11 Dec 2023 10:04:29 +0000
In-Reply-To: <20231209233106.147416-13-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
	 <20231209233106.147416-13-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.49.2-3 
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2023-12-09 at 23:30 +0000, Peter Griffin wrote:
> cmu_top is the top level clock management unit which contains PLLs, muxes=
,
> dividers and gates that feed the other clock management units.
>=20
> cmu_misc clocks IPs such as Watchdog and cmu_apm clocks ips part of the
> APM module.
>=20
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Will McVicker <willmcvicker@google.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Cheers,
Andr=C3=A9


