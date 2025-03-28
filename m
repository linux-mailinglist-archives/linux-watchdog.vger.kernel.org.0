Return-Path: <linux-watchdog+bounces-3165-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A888A7430B
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Mar 2025 05:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 231861893FD9
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Mar 2025 04:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C791A08B5;
	Fri, 28 Mar 2025 04:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZoRYMww"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B81714F11E;
	Fri, 28 Mar 2025 04:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743136915; cv=none; b=AsID6vemuEL03BufhiNIa1ND8gynqJ/zxuVIWzK9NJIICF6E1XSjRfrDfIon+RzbPAa56aTLNoqe0bO1UgciO+2dZ8g4ma0/5XCvg671v9wTl/r6+enpK32n5TplEsOyqsLWjq/Eqw4/32EeJUkEl39+NjmCqs4PQ3gW1eHxkfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743136915; c=relaxed/simple;
	bh=lgjNZxcRDwmASamYFFnxAYYwYKIpdKj9jeglt+wPP8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=POoq4MpXnseaKuBSaRrtnyoegrsIb4fzLIXLRnfaZAtouyned9CVVmUHgqUE9Z4uQ5wBZ9HsFF/29pwmRAXRjHzwAf/0dSVAoVTo8FbnAWCKA5mH7m0m/j16s08pmV4xa8TqGp61rJxGysMSYKHsE+7rZzpk0ErrVF3IaOP66aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZoRYMww; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30332dfc820so2888114a91.2;
        Thu, 27 Mar 2025 21:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743136913; x=1743741713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8cDzefW9v/a2UVbOEaMdH7r/je/KKOPgsOOsMN3Zz58=;
        b=fZoRYMwwIybkoqJGvfnEMH+aNuclQPnynq09lEY5O5EcDt2Vz1fqk7ZXWIUVzn7aVf
         Tqi5sCGy1LBP9vl1cyoA/brZfwJkYisx965nytYj7/tz1ZlWTzsLezAb+jiDEqiJb0vm
         9ScZFGMtzgLKqIxrcph4Ycl0Y3XHli3LBP5aRmuXQ7AYyzWA5SAH6RwY78vErh9Sr4GU
         zXn29+y6kjqEEg0c9FauefFF3YzzEdn8u1wtYdTjxpX6tsjZmXRk/ZpaULC4VKmx5nF1
         YG2Aum1bEXocggzmmitzQQAhW8mRYswmESy9xFgD9WW8mNTdP/2HyGebxoXSftVcYcqo
         0N0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743136913; x=1743741713;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cDzefW9v/a2UVbOEaMdH7r/je/KKOPgsOOsMN3Zz58=;
        b=rCpMP+Rl9zGxSoKbcWLPBEeXFAB03qwcOWXNQjD3jxl7FGOhEMuwmXC7QU9fsYvFle
         FnzCdLCTl1fID1zH+YRoJKMpKJ1RKODw8ssqf1DaEsfRFZEHqomwOg1hEAgAxsvVSs1H
         DzUYaGv2BAPWrM+uO4lPz7vgNVRGk4VaubybvMRgY6+EX5UCgwJRSZWrLwvy9CFPcOcj
         oWB0xmK3iT+WPREv5Mq3nR2OJzF0fJk0q8DqeFAhv0NNoVAspxHeWivSCJb70dWgJdRO
         Wt3C88e8fctZpN+HJN1hZDAIGYFJ0dnji7H0n/JyzA/SKOZjsDkQ2GpVMyW+cP+NyQ17
         1dwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcDRzW+pe/cBRKUEU2WYQSJTyISNL0BsAugGzPEa4JixPd3YjNZMCEkSwGIPS6VSCb9yTV22WS4aWa67Wo3SE=@vger.kernel.org, AJvYcCVujB63vSDH0qRdPFs3NnSDuciiV3q9rlb/YMMVt+8mAfMDblap0Iuvd46ykOMyAqkYt8diIDB87Q92GY4f@vger.kernel.org, AJvYcCXU3OMjLXqu89tNk31aHJ/Fu4V2UfGrkGRdlk5Tb1YM8E+mdO4T/HWXWM74XZZLIsPUDZvl5yxEbWyJ+hBsCm8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo+dnoaLSTskr0IiAvk6wyhnHiFs54dLH6ofaAaqTny/YHFNHk
	uiNIfuyuSTQRzFJQKYu0vsRylJiffdr8W+IJZ+ruAGQSB8hM/Y8B
X-Gm-Gg: ASbGncvAo+u6p4iJ2YC6FUXniJ7RqwevX3jQWJCdAmsdHdHPN6yImydNTQljDXxbqjj
	blE+H17a/leHXfVR+kYGFT+ZM2C1fGFyu0uLEHxpDZwLxW9V5ULGgoJ/8w+q9JhUxc1mh6jLxmP
	x8oJ+t6Po+V194WEyCMtmWm/G8xIYlFBp5+SqqMCXG82avBLpnUyQ1W0dwkHKBvzwKqhFX2YJSq
	ETcJTybFXVnrMllSqFMBnoGNNnT1vrJtJx4xcVcFfnSvb5ZCZdQ7zepQbWkC6SD/vKGLWVXu5rr
	i4eHW9INtDTTyzV/lRd74U7rq9irU9X9uTm1EKlmgsgYkgmgkWFKyvlcnGOpPvusaW/0aDI19Im
	tVbs6lxdTdKI1/4+6/pAGnqL1KDxA
X-Google-Smtp-Source: AGHT+IFUr871gBbcE/ITOJcpUtX31Ab3GbZp4AbSiOfXeGRHHqZwTYc3dshdaDL7cQBzEkE3cXj8kw==
X-Received: by 2002:a05:6a20:430e:b0:1ee:e24d:8fe3 with SMTP id adf61e73a8af0-1fea2d90449mr9947884637.10.1743136913094;
        Thu, 27 Mar 2025 21:41:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b69b127sm738649a12.17.2025.03.27.21.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 21:41:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3f9fcc7d-931b-446a-b36a-1745f650c6cd@roeck-us.net>
Date: Thu, 27 Mar 2025 21:41:50 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2][next] watchdog: cros-ec: Avoid
 -Wflex-array-member-not-at-end warning
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Lukasz Majczak <lma@chromium.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Benson Leung <bleung@chromium.org>,
 Tzung-Bi Shih <tzungbi@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <Z-WG6_uhWsy_FCq3@kspp>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z-WG6_uhWsy_FCq3@kspp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/27/25 10:12, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Use the `DEFINE_RAW_FLEX()` helper for on-stack definitions of
> a flexible structure where the size of the flexible-array member
> is known at compile-time, and refactor the rest of the code,
> accordingly.
> 
> So, with these changes, fix the following warning:
> 
> drivers/watchdog/cros_ec_wdt.c:29:40: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


