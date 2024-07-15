Return-Path: <linux-watchdog+bounces-1391-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13221931CB0
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Jul 2024 23:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C66C1283332
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Jul 2024 21:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 629745EE97;
	Mon, 15 Jul 2024 21:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uo65CvRN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D057B3BBC2;
	Mon, 15 Jul 2024 21:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721079749; cv=none; b=szszY+d8+9NLQ3/Hq0j7lVTFHzZYScebO9YmGrBuxYl5ogwEnPhMkUl/ih5HAAJKSs3boDC8w3tV7QhSVyNWBezsKvJgC0TKJcrEgTABIXsyHj74pDNj2i+jbvDoA0R1RxXpGzEhuf0mIdgdNfiKp7BvIWkZLE8aDHKvuUXC6nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721079749; c=relaxed/simple;
	bh=arZWug27IcQkXdsXmC1XbiFLh+ij7nNt6WOmMldScUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lsTuA6luF/iKDYzgIfbd/wta6HMlXZqI3QDiOuOz9lkos5shkKiQa2EqH78F7ARAF9d7UGEu0Ep20zQn128vVvywTEQ4Psf1VfYXfZFnFuYb9XVU4GUDhb0p58/RrAurGrGmIedO1FpWe00VnMxZJRIUE/e+26aI0CZM5bQjBYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uo65CvRN; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7037a208ff5so2873487a34.0;
        Mon, 15 Jul 2024 14:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721079747; x=1721684547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VYAGhYRjifYhzMKJdhkptuS7CtCn148ldXzyC77p4CU=;
        b=Uo65CvRNkgVF2MydLZtcfGoQS/8eqP+QIF+zc8sKwUwR9/C7ym8V5ck8VqQjKv2Sjg
         JBVZl3mwt2oFgMmmyR0Whool4XVgtZPeA9UpmEA/3qehzvfbxHaMmHU7xLKUWj+fHLjE
         wvPSeyYUdM9RFUF78x+On12RLr6lTEwU9Wg/8Earmtu+NWMtFPD5NAobuu8GYvlciLK5
         iJHNHKEhcNOh6Eb9zv3koc326FX8qzB5xzSxrglwPbE8pUXq7ryBY7y1bgXuPhv6TGbV
         YyAA0IsYADN3QKthk6P8JZCOnhUj0EHVZfaCks5XmzEJhwf8vkZxKh3A32Upq1fpdCea
         Qwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721079747; x=1721684547;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYAGhYRjifYhzMKJdhkptuS7CtCn148ldXzyC77p4CU=;
        b=nHqW6Gg+VssUgFNqbotJ6ZBZLS1r54z7rrzX8nl0/OJYFhvBKEedgBq3SlFa0DA7gk
         syGGpQ3V4YbXboDotZ47DPlxovIwX2llluvHtyh0NSf4KvA1UTvnHeQn24r2EKVnf5gp
         tJdX3d/0o4yHaVjUw7CvPpzEKIzynFsNjd1eW9eeJLQcIC1DDActpKRN6afWi8xMpV9q
         39NJ6hKXmdvsm7cHtEpxJrS1yJt6OC4MerPQmuhEKUx6yZ/caw1yQ2kyuSs7tQ+q7dm1
         U3f0xqbyAPuYfFiOQBiqHCcaZEYEUggVLD62hx+gCPobo7haRC2B7f8Ykid9C4NT9lZA
         0u3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8b0MFyua/12KkXZd+tzR1LxmNqN4H2ZSGd9KttWo1dGeB/NalmrTCHzkMOL3Cykn5BBDGZyKYl0mY4E3DX6Rmb8+mQEN6ta/2Lh28hU7Tv02QPQVxnA1CqW0loXXosMFM0gJzEr4Nv/IBGOE=
X-Gm-Message-State: AOJu0YzwHgJLf5C/FbN6SnlYbIk97dw/0QKWrIE/D6Cox7GhFr3tekRG
	Xrs4oTEuVyICfAxHquAzC3Ku9BfYWzYUTK1qRzLnwG2YQGmm3PPd+mSmqA==
X-Google-Smtp-Source: AGHT+IE+CdyJ6BUn/1t+39m10arPNQnga6eSnwBOEb5+s+y7OLe/lSZIdMKfWs0nUIbxgC7hN8wDSw==
X-Received: by 2002:a05:6830:61c6:b0:703:6988:dbed with SMTP id 46e09a7af769-708d99c31fcmr487911a34.34.1721079746864;
        Mon, 15 Jul 2024 14:42:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ecc947fsm4892666b3a.195.2024.07.15.14.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 14:42:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1829e700-6b0f-42cb-8b08-81ca2bca4e24@roeck-us.net>
Date: Mon, 15 Jul 2024 14:42:23 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into
 struct imx_wdt_hw_feature
To: Frank Li <Frank.li@nxp.com>
Cc: alice.guo@nxp.com, festevam@gmail.com, imx@lists.linux.dev,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 s.hauer@pengutronix.de, shawnguo@kernel.org, wim@linux-watchdog.org,
 ye.li@nxp.com
References: <20240715170717.2490688-1-Frank.Li@nxp.com>
 <3ae98ea1-23a4-4e0f-9a1c-62eed84b42ef@roeck-us.net>
 <ZpVryrvsypzFrbma@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZpVryrvsypzFrbma@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/24 11:34, Frank Li wrote:
> On Mon, Jul 15, 2024 at 11:01:04AM -0700, Guenter Roeck wrote:
>> On 7/15/24 10:07, Frank Li wrote:
>>> Move post_rcs_wait into struct imx_wdt_hw_feature to simplify code logic
>>> for different compatible strings
>>>
>>> i.MX93 and i.MX8ULP watchdog do not need to wait 2.5 clocks after RCS is
>>> done. Set post_rcs_wait to false explicitly to maintain code consistency.
>>>
>>
>> Why ? That is not necessary and typically frowned upon for static variables.
> 
> Some maintainer in other subsystem like explicity set to false to read code
> easily even though not necessary for static variable espcially there are
> already one which set to false.
> 
> I am fine for each ways. You are free to pick up v2 instead of v3 if you
> don't like v3's change.
> 

That is not the point. The point here is that you made an - in my opinion
unnecessary - change to this patch while at the same time adding my
Reviewed-by: tag which applied to another version of the patch.
This is inappropriate. Please refrain from doing that in the future.

Guenter


