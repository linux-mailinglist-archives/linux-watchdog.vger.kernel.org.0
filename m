Return-Path: <linux-watchdog+bounces-1190-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B5A917BBA
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Jun 2024 11:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5EC91C21469
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Jun 2024 09:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836691684A1;
	Wed, 26 Jun 2024 09:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6XZ/z1Z"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C86415F33A;
	Wed, 26 Jun 2024 09:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719392849; cv=none; b=mTn98hhB0FK9AwDZzUKrug/LcNUlRJhkpC5xOiluJZHpP/62nN/s4QS1Qsz66uM7Nup7SKnyIPvX4pPGnZ3Fw0sJwoN811tft5HhHSutEaBqPGIYoQLcHThxVVtqVmItIJyylscoaz28Q9+IIq9IuFNnYVOZBpTyBaS9anjFr1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719392849; c=relaxed/simple;
	bh=Vef46PKEnj+c20gxbE0Uu58kS6RdxRRCUeDVUuJMjso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=km82hDP/r0N3FrQqCJy9wdHVKI6j/5HmQp0rRhyUDqaQ1BEdgVBIYK+cqK/eAC8KcM14iMMSJwTdCZu4ayvQQ5v/xBwit2jc8OIw1zqIS0m8Xvzkdg1h6qwCg2qi0shAKph5q9bft7svQSQjNeIX5J9FKfGq/1Wm8SMGGhM5JGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6XZ/z1Z; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cd87277d8so4868519e87.2;
        Wed, 26 Jun 2024 02:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719392846; x=1719997646; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=76/161HoTumb+iDrdbol7NJLj3KBEjm/AeLJQvuGQYM=;
        b=E6XZ/z1ZNeF2Ss0WOEfCd4s1EJF9pjBH5N3hUKRSHhQrUfJQ0ELSBT7oHYdmC81oW0
         kBsHCNf8gkT0+qW7IrNKYXM7R3eYGXkXBlDdxqzKgdg99HACDFyrQvufhnT67prkfjoX
         OnKt1V5nrpXfUN1+q5xx/7ELGNeqocGTrWqtwrz+lbOIiKyGsKgkX551KJRqZKalGitr
         dLjddjOQcDe4D4XomgDRyKgNMU6O82QMul+jo3JVaLYxkFTHRhyk1H8K3ED5nNArBGwW
         SvWjG/6CTxhbXKezErJXE/ASak8YG0BRLy3vCdcTvnha5YY51CBgv1y9DllnzTClFAQC
         O3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719392846; x=1719997646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=76/161HoTumb+iDrdbol7NJLj3KBEjm/AeLJQvuGQYM=;
        b=srAiVKSKsaJWJ2YgttVkbvLFq32g9GmjAqM6Qz+JXvm6yZ1NRfC3JFXwiUoKkClKk2
         b48Vw2lmlsaUOp8OUHqe8cojxnYtSdMV856ysYxIalE8kbqBY0Vngre9BSGpQY+nIq2i
         8oa0ORHXgADoEfMtoqID8RlOaLRT+dzSWD9l6YGeZax8nCREUxOEnLkNAj+O7VpbJCyg
         o9jDeaOSDdXHB8pTyTxVY9Trip2tmdi/8smjTXxxagvNLCnNGpcJw5XAC45QZUVFVJlN
         IbvYR84mndUl158wZm/S90JB4J9AzX6Qy9pzDl/Tt0n4sbIP6XJTVA5ad7Km7q7v/fgP
         d9oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFglCX73AxZGiJ8d1uAVW595GLrCmRzfOapfgnTCgX9De7TYggq7hLTCBFU1wrbfAalPjMHk1yUFPHosYNSmQnTnrE5I0acCPmrkA6dLSc4NbdH1ZvFePwUdIRdo3YsajpTW+jgchTMqJ1hklPwdT/Ms3pjYUFxxEgddo3k5lzue+3ULQT4PiY
X-Gm-Message-State: AOJu0YzxKjHxLT+q/7tmAa4DngzTWp54eR5gHayqeKuU4S82JiStEApC
	Xc33jC6R6fpa/P5d1E9XxwExW/FbA8Sl2EThf6nJ3LjmjizuKT2bY2c8Yw==
X-Google-Smtp-Source: AGHT+IFZmB6mGtubKzB8dHrJhQUZN+wpPbJjxQUSSxefcinOlw8QmfoZ2F+jKhN6CWJaO6QMqWqLEg==
X-Received: by 2002:a05:6512:3450:b0:52c:dea8:7ca0 with SMTP id 2adb3069b0e04-52ce185cf71mr5655473e87.55.1719392844938;
        Wed, 26 Jun 2024 02:07:24 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd? ([2a10:a5c0:800d:dd00:8cfe:d6e7:6701:9dfd])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd84b23d9sm1455429e87.202.2024.06.26.02.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 02:07:24 -0700 (PDT)
Message-ID: <8d964b3f-e2d0-44b2-bece-92380b8c9a5d@gmail.com>
Date: Wed, 26 Jun 2024 12:07:22 +0300
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] Support ROHM BD96801 Scalable PMIC
To: Lee Jones <lee@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <cover.1718356964.git.mazziesaccount@gmail.com>
 <20240620143859.GM3029315@google.com>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240620143859.GM3029315@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/20/24 17:38, Lee Jones wrote:
> On Fri, 14 Jun 2024, Matti Vaittinen wrote:
> 
>> Support ROHM BD96801 Scalable PMIC
>>
>> The ROHM BD96801 is automotive grade PMIC, intended to be usable in
>> multiple solutions. The BD96801 can be used as a stand-alone, or together
>> with separate 'companion PMICs'. This modular approach aims to make this
>> PMIC suitable for various use-cases.
>>
>> This series brings only limited support. The more complete set of
>> features was sent in the RFC:
>> https://lore.kernel.org/lkml/cover.1712058690.git.mazziesaccount@gmail.com/
>>
>> The v3: implemented also support for ERRB interrupt and setting a name
>> suffix to IRQ domains. That work was postponed and will be continued
>> after some unrelated changes to irqdomain code are completed as
>> discussed here:
>> https://lore.kernel.org/all/87plst28yk.ffs@tglx/
>>
>> Revision history still tries to summarize changes from the RFC for the
>> reviewers.
>>
>> Revision history:
>> v3 => v4:
>>   - Drop patches 7 to 10 (inclusive) until preparatory irqdomain changes
>>     are done.
>>   - Cleanups as suggested by Lee.
>> 	- Change the regulator subdevice name. (MFD and regulators).
>> 	- Minor styling in MFD driver
>>
>> v2 => v3: Mostly based on feedback from Thomas Gleixner
>> 	- Added acks from Krzysztof and Mark
>> 	- Rebased on v6.10-rc2
>> 	- Drop name suffix support for legacy IRQ domains (both
>> 	  irqdomain and regmap)
>> 	- Improve the commit message for patch 7/10
>>
>> v1 => v2:
>> 	- Add support for setting a name suffix for fwnode backed IRQ domains.
>> 	- Add support for setting a domain name suffix for regmap-IRQ.
>> 	- Add handling of ERRB IRQs.
>> 	- Small fixes based on feedback.
>>
>> RFCv2 => v1:
>> 	- Drop ERRB IRQ from drivers (but not DT bindings).
>> 	- Drop configuration which requires STBY - state.
>> 	- Fix the register lock race by moving it from the regulator
>> 	  driver to the MFD driver.
>>
>> RFCv1 => RFCv2:
>> 	- Tidying code based on feedback form Krzysztof Kozlowski and
>> 	  Lee Jones.
>> 	- Documented undocumented watchdog related DT properties.
>> 	- Added usage of the watchdog IRQ.
>> 	- Use irq_domain_update_bus_token() to work-around debugFS name
>> 	  collision for IRQ domains.
>>
>> ---
>>
>>
>> Matti Vaittinen (6):
>>    dt-bindings: ROHM BD96801 PMIC regulators
>>    dt-bindings: mfd: bd96801 PMIC core
>>    mfd: support ROHM BD96801 PMIC core
>>    regulator: bd96801: ROHM BD96801 PMIC regulators
>>    watchdog: ROHM BD96801 PMIC WDG driver
>>    MAINTAINERS: Add ROHM BD96801 'scalable PMIC' entries
>>
>>   .../bindings/mfd/rohm,bd96801-pmic.yaml       | 173 ++++
>>   .../regulator/rohm,bd96801-regulator.yaml     |  63 ++
>>   MAINTAINERS                                   |   4 +
>>   drivers/mfd/Kconfig                           |  13 +
>>   drivers/mfd/Makefile                          |   1 +
>>   drivers/mfd/rohm-bd96801.c                    | 273 ++++++
>>   drivers/regulator/Kconfig                     |  12 +
>>   drivers/regulator/Makefile                    |   2 +
>>   drivers/regulator/bd96801-regulator.c         | 908 ++++++++++++++++++
>>   drivers/watchdog/Kconfig                      |  13 +
>>   drivers/watchdog/Makefile                     |   1 +
>>   drivers/watchdog/bd96801_wdt.c                | 416 ++++++++
>>   include/linux/mfd/rohm-bd96801.h              | 215 +++++
>>   include/linux/mfd/rohm-generic.h              |   1 +
>>   14 files changed, 2095 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd96801-pmic.yaml
>>   create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd96801-regulator.yaml
>>   create mode 100644 drivers/mfd/rohm-bd96801.c
>>   create mode 100644 drivers/regulator/bd96801-regulator.c
>>   create mode 100644 drivers/watchdog/bd96801_wdt.c
>>   create mode 100644 include/linux/mfd/rohm-bd96801.h
> 
> allmodconfig and allyesconfig builds fail with:
> 
>    make[5]: *** No rule to make target 'drivers/regulator/da903x.o', needed by 'drivers/regulator/built-in.a'.
>    make[5]: Target 'drivers/regulator/' not remade because of errors.

Bummer!

There is unrelated change in the Makefile. I must've messed up a rebase! 
Sorry! I'll send new version with corrected Makefile - latest early next 
week. (I suppose new version is appropriate instead of a follow-up as 
this breaks the build).

Thanks for the heads-up Lee!

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


