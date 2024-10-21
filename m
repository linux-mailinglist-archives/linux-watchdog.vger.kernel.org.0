Return-Path: <linux-watchdog+bounces-2241-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7E29A579B
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Oct 2024 02:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 180142819B0
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Oct 2024 00:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26857E9;
	Mon, 21 Oct 2024 00:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJOhFzpP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C790D629;
	Mon, 21 Oct 2024 00:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729469636; cv=none; b=dI3BqsVIcEeYchQAKyFSfqTz7hm12YK+g7Tcs7BtlPEhS6s8PZZtAFWf7qQ24YlPNXl/R6gs3rH6maHM5XSXjxwgAPYa0HSI315ZAaKMV3+OoA6+SpGlv2upb7T68uM2roQiKgxHMboH/eyI/24ptRu7KLF7NbG2e9vK0G/ASUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729469636; c=relaxed/simple;
	bh=sW5Mt3nEUcIQa/VtQjdOPA81IywbdW9I1tYBy4ToXRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j6XBdKPlAXBa1ZNa9XSOvYTeCDnRqR+OoyAN9/TjAFyvB+/BY5z1BBOG3zAJ46zLRDRpBy64Gg8fPzvhxgMBHlOWNdnShTzGZ7fmtVtSOjqOds9LjP1XaAX5ZkfoicFp5c/7EEmC7XQYdhndqsO+ECv3SQExyTW1tTuo8mTrMPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJOhFzpP; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71e70c32cd7so3172870b3a.1;
        Sun, 20 Oct 2024 17:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729469634; x=1730074434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=w6Xk9qk9a7hgz0iX0UKEvWAgvMCxqKa4LoDYhWjmp9M=;
        b=mJOhFzpP4goZRcnp7hfABMRpYN6FCTgtBr50GSO2ovwPoini6e7jwrIanMunLKf7QY
         QL9m7RvafGYa+BCa0YDeM4GUOpZz6EhWBdsRE1AORtENsO/7d2RbIG3OEQylR14xZgpm
         FYIP/Zd8NDAVjyqJAaQCw7Gn6JsfT2RAkBtaf6aR+/4DWJS7fTE4zPQLlcxrJY1A4Rnb
         a47XeUEnwsFLnfNFrU0TaHhBHdtnCuub8kYBZTDPM6a81yO30y+szKHBIaEKFPLEp2Sr
         xo870q1gwmflYEYjw2jcKEYuE9dalJb8G6C5a+OzZNQk/6scnInPoRIv5fUNvaL7zZAI
         Fuzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729469634; x=1730074434;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6Xk9qk9a7hgz0iX0UKEvWAgvMCxqKa4LoDYhWjmp9M=;
        b=Ryud/T/OSMHnD45Xs/xCGbAM2bYOfezgvR0i+Ev2L+68VnODmff+eDMQCmaVuqO36g
         qjg6Zka2Y4FdgRAkEfdn9PwccxvyHiX28TyyI50TnsDXuvVVQlA1+3UQB5xex5IcySmi
         7t6hzz1ieuetDEjvVTq/XCsIB6cPGlodaOOLEWmMgwi/97lsfSoMJNjB5S2jLV/70hqn
         68OImSRNgrAYiqetHVIwz/zkKnylAsnYOcTmHInuFnpTLQmUiOGiAqmajzYnPO/kKdiq
         SvpahrVxtmdnA7ZpX3oxWUUczocBsLyH1T+nFFdaLg+nBGi3kw6H1I7ZihUrGA/CDNF8
         gA1A==
X-Forwarded-Encrypted: i=1; AJvYcCUwy+5OmdiEmJuppos2872s6lF3mP70E4fp+rloSgItqYE5JrRH7M51w5Qip64OFY0uHegQguvwi8CBKwVbhzI=@vger.kernel.org, AJvYcCVjmRdG0pTGjL31K4IzPSSzVxzCcS7cv0mP4D5FUJPxeH7bphEA5qkA6N/Mg8WvGl/4f/GbJMqLyV114hA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAYdw0W2B2+WA7RH53rtNtJDgHdUzVa4OvMM9UaxxnIqbHbA+g
	7HfnAoZ84GDBzbzOVW0+9v4E44U2w5OYOmUcFDYPXsBcsN9GnbCQoDcD/g==
X-Google-Smtp-Source: AGHT+IHPHpf7EHyHu54y+YMDg8LtqJVwjHv30lGGdTGumWS9hIPhLY1AmkX542ZXCWZJeAlLPI4v4g==
X-Received: by 2002:a05:6a00:140c:b0:71e:5150:61d6 with SMTP id d2e1a72fcca58-71ea31d290amr14891464b3a.21.1729469633839;
        Sun, 20 Oct 2024 17:13:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec133370bsm1689175b3a.79.2024.10.20.17.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Oct 2024 17:13:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8120ccfe-0a82-47a2-bec1-bd577972d145@roeck-us.net>
Date: Sun, 20 Oct 2024 17:13:51 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] watchdog: it87_wdt: add PWRGD enable quirk for Qotom
 QCML04
To: James Hilliard <james.hilliard1@gmail.com>, linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, linux-kernel@vger.kernel.org
References: <20241020232410.2576778-1-james.hilliard1@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241020232410.2576778-1-james.hilliard1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/24 16:24, James Hilliard wrote:
> For the watchdog timer to work properly on the QCML04 board we need to
> set PWRGD enable in the Environment Controller Configuration Registers
> Special Configuration Register 1 when it is not already set, this may
> be the case when the watchdog is not enabled from within the BIOS.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter


