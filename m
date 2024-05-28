Return-Path: <linux-watchdog+bounces-1077-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D748D1D3F
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 May 2024 15:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD31028152B
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 May 2024 13:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFC216D4E3;
	Tue, 28 May 2024 13:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c59oImeF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9C817C7F;
	Tue, 28 May 2024 13:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716903560; cv=none; b=amMSD0SDAW5zOPBv7uoCJLqYNg8uiRVVb0mfyZXHJVME+2YsEC/3I15pCrCaunSZ2EWkFbWU6A9herUzj30sKApX4CaEhFf/IjYcOVQs9zt6YwtcG9Sp06G+If6U53PaLrBnQajBFwg2wf5CHeir/lBxplwwfuQlkeen/u/om1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716903560; c=relaxed/simple;
	bh=2jNHHISgzmmu0HWBMmKiL9K/6wMcr5DAtI7972qMwHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KID8YL1uBp3KRHk+rrR9BnkVSuDmpkFA32ZRUx23P0nRm+nj4mNiZaPv6QDEnCLwf8PKxU4SJdUd+bAYW2NIC8R1iszIAn3zczL5whUpkEoDSEuR2ZwqV+rkLTHbckvJy3hAycPlZI4Sbk/hBGDcsikZ/+XOnc2aOaNhugK3ZaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c59oImeF; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2bfdae0b0e0so668098a91.0;
        Tue, 28 May 2024 06:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716903559; x=1717508359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bj3R4EjF1QBZQsUr1Xs3RRu1us8jqj+uTGgy2dREVMs=;
        b=c59oImeFm2OlURsNR5ffl5RUcsr0cP1HIGX763RVsD69lZElnVbio13JMCqAJMWeRv
         UeIF6eWOyu8TIAUBVY+6VmIsc2Bpq+khsI+vtPYc5gjLvvVMAANVVO6zrk3R0gqjhbNF
         7nmWnnuWiHb2rBtwH8zag7kq9iitLeErmt7yl4LvLsraEbTPIpWI0hxIKRysA8B3oWtg
         F0wz3gERux5QftYmmfxqmsCN6bdFul5scWG57DQfizRU9QqhJNfGpSO31coUbPPSjI1s
         m+DWhvMVK88FI0kqja5yumQGivA/0xQOsxmBqumnQHyF5ufYG1m3tgQEMzeL6VF3Q/db
         CsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716903559; x=1717508359;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bj3R4EjF1QBZQsUr1Xs3RRu1us8jqj+uTGgy2dREVMs=;
        b=KZ0LcfXVpAywTcrL2Zel704IXpZZ0AqshNKB+ihzO2EpZFcj4jpSXFrwE55Ij2Fc4A
         OeR61cw3F4IKFANMUghY9y+4EV+hKkmZ5jD8GwdixATTB/ku2otPw2OlRZdFEi9+Rfs1
         uTZu4RRqQVzXx5crWPPR4GaSWDB5fmeiRnlvCFFmvAZ+IcjFb1QrCdKFYUhwtmnDQs5Z
         CSTmpvy8QFBZt48VwZVz67eoKSjYprzmjEcFcoyZB87+iX7QiqXErzdoYPkGbCqCPFik
         ZR6UYfcRIW7IIINthKiSu8YcZNV2KmEFQLHy8EASBHdezSI3HPLuuTS42huOJEvCQPml
         V4xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvcu+CabCU8pEvqKaDTuVZoEihbNaDjSsGYWgWHRJi25QgUT93q7PLnEclJuN5v/IBDZmAH5DreNAh59qTOQA7RB2o3Fe8cRhdJMJ0YH+1kWa23JidtEx6PAF++Sy0kMnd0336Rgnmyg==
X-Gm-Message-State: AOJu0YxS032zTEzcTnee7Di8hZP7hfAY4h3gagpw5rabAQRI2+zcpCf7
	h82ln5DrwxBzeO8bsLZLsSCJTX8w+sZQXIgYOzyzKNNzSC7OQrsL
X-Google-Smtp-Source: AGHT+IE8o+1r68USlRRObYRtI5TudUiQHWTg1gXqG5SSOD67c8BUFUq+LpehdJeJzxBj605tSHyDUg==
X-Received: by 2002:a17:90a:e00e:b0:2bd:d42a:fef7 with SMTP id 98e67ed59e1d1-2bf5f74e008mr10542755a91.35.1716903558546;
        Tue, 28 May 2024 06:39:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bfb0d2e35fsm4635348a91.15.2024.05.28.06.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 06:39:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <729e0b91-b7f3-4adc-8621-29a4b14bea1e@roeck-us.net>
Date: Tue, 28 May 2024 06:39:16 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: watchdog: img,pdc-wdt: Convert to
 dtschema
To: Shresth Prasad <shresthprasad7@gmail.com>, wim@linux-watchdog.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 javier.carrasco.cruz@gmail.com, Shresth Prasad <shrestprasad7@gmail.com>
References: <20240527195811.7897-2-shresthprasad7@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240527195811.7897-2-shresthprasad7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/27/24 12:58, Shresth Prasad wrote:
> Convert txt bindings of ImgTec's PDC watchdog timer to dtschema to allow
> for validation.
> 
> Signed-off-by: Shresth Prasad <shrestprasad7@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


