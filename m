Return-Path: <linux-watchdog+bounces-1146-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7627890990D
	for <lists+linux-watchdog@lfdr.de>; Sat, 15 Jun 2024 18:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE903B2147D
	for <lists+linux-watchdog@lfdr.de>; Sat, 15 Jun 2024 16:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7289E4655D;
	Sat, 15 Jun 2024 16:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWSptkeM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE451DFC7
	for <linux-watchdog@vger.kernel.org>; Sat, 15 Jun 2024 16:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718469261; cv=none; b=cr0tE+zLmZiF58y15xFs2w1pyTQ6GmiKXgHLky4KUhMw4Tg2dViDVIHjJMnYMjyu1ewMSxkrHz6+u9c89z5A8n0YYYGilYDtP0OFUgjOScJDIiDlKbf7r5HvnP/noJ2ScU5iFfvE9LzOJ+o/iUUTUGrRSAHM3gBGHLbVro8FwmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718469261; c=relaxed/simple;
	bh=8pua4o1cyTqDRdRluAi9HB2xMIdT2IkUHJceHO8yweY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TGHbxyAZB/eZm6HShW1otQsFjxMlRMCRV+Q3LElLYN5yem2lyFiRMEpD0sKRG92btbqDpnb2yqUTvFA1adG9xavLcnv313mnu7id3CiNxLP6lgXiQ+xa/l36xXsha/5qVwJ7rmLnfDVNA+i38eP7WtbVZxcdK7hM4ZrrAKXxqAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWSptkeM; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f47f07acd3so27881865ad.0
        for <linux-watchdog@vger.kernel.org>; Sat, 15 Jun 2024 09:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718469259; x=1719074059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PDM1oM1XC8WReZKf+c1OWc4+c5xQRkyV7QKWGB7jZvs=;
        b=NWSptkeMz0DdhhsSpD9/t56X+68XnBwUyyi9qvYBWQZS65OpXgE/ABe0SEJo1xmexI
         7B5g+/sUevZ2FM8WkjpDn/UjfwT6K7D/aRum+Z83gZ5HScY/tYigPokjgCmKQGAJEh7l
         Nv4u9wDvNeW+MS+F1dGFlZn85LVi8JP9q/M5C8V4h4w1gAa9/x0u6eZvEM9C7FRdTFyK
         rX/ooegqQ3Nrxi7hQCwtEOXiDddtwR4un1840ezflonWEp2VW+RLwRd2gT/edY/zhqzp
         6ipWI2g8H77ZASt5AdDGgG6GgaRNW88s/lfKrR2yFRkn4CYZiOT6Oy9bjpjI7xqDrhgb
         CYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718469259; x=1719074059;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDM1oM1XC8WReZKf+c1OWc4+c5xQRkyV7QKWGB7jZvs=;
        b=EhUbrPqVmYwHiJpuwjsKRSknDFjCU0h9sm+t1ANpW9m+TJIO1ySbz0u9cl7LpVAcCK
         rqEEEj5AEegZ+e2Vn6bzhslOvYCrN4Zos/dUlMW86gG9RnDBIOz50y75kxFjh8XP3VnC
         f9yXr/s8yPFHAh/Hz4mk0+bXMHHG5ylLWtq8JEpG2FCKC/AHp3RVNLZ5clnjf3PQoK04
         E7MVT+V0br6NWaTFZwEbfNfOFolSb+urlCWg8lnpjUBPq5ksieDyfJ7qDVnJWhLsdJuC
         VBUhcd0GNlCOSHL+v7Zuzgdh1PMUWrXT3uWc2cPy2o/WP7+de6v9MlyAi2pqZCBZI5Hj
         jNAg==
X-Forwarded-Encrypted: i=1; AJvYcCUO213640poEppKAGvwiC9lG7T2XR05/SrKA2vJ5iPpCwoOhcoABHjdIE0J+v9edF8wtYokF4v9IyD3F05vnwvZcFGvbFcrwL2f9kUMUcc=
X-Gm-Message-State: AOJu0Yz7aeb7lCxfYWgDgwRyI7ZbZJmrDPX8z3nAS35XkmO0eRcE15Af
	q0PmeWK3MX88q3Uzk+WQ5pkwfNPidH+nT9yN/kQ3QYSnMhi0fznY
X-Google-Smtp-Source: AGHT+IG7+bBwyXaUzMhXfv5dJ+0SUwpmFnCcsegrTytmMnVom6Js/AR3zA6hamwyd6CmsLiHP6GC1A==
X-Received: by 2002:a17:902:f68b:b0:1f7:1706:25ba with SMTP id d9443c01a7336-1f8625cf2b0mr63491305ad.15.1718469259111;
        Sat, 15 Jun 2024 09:34:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855ee8004sm51882675ad.121.2024.06.15.09.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jun 2024 09:34:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1ee5eeec-cda8-4977-a596-ec3a0e3fc8a9@roeck-us.net>
Date: Sat, 15 Jun 2024 09:34:16 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: imx2_wdg: Save the actual timeout value
From: Guenter Roeck <linux@roeck-us.net>
To: "L.Q" <lqking7735@163.com>
Cc: "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 =?UTF-8?Q?linux-watchdog=40vger=2Eke=E2=80=A6?=
 <linux-watchdog@vger.kernel.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>,
 =?UTF-8?Q?linux-arm-kernel=40lists=2Ein=E2=80=A6?=
 <linux-arm-kernel@lists.infradead.org>
References: <20240615141059.345076-1-lqking7735@163.com>
 <8db871d7-154d-48c3-b934-e480991ad8a8@roeck-us.net>
 <57e6bc77.319eb.1901c76a5fa.Coremail.lqking7735@163.com>
 <480b0513-01c4-42a3-bc8b-5ee6e711a1a1@roeck-us.net>
 <7814550c.31a49.1901c98ad6f.Coremail.lqking7735@163.com>
 <69dcaeba-a077-4f41-92ef-669392b66c24@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <69dcaeba-a077-4f41-92ef-669392b66c24@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/24 09:21, Guenter Roeck wrote:
> On 6/15/24 08:51, L.Q wrote:
>> Step 1:
>> Call imx2_wdt_set_timeout with a timeout value greater than 128
>> This illegal value will be stored in wdog->timeout
> 
> This is not an illegal value because the driver sets max_hw_heartbeat_ms
> which lets the watchdog core handle timeout values exceeding the maximum
> timeout supported by the chip.
> 

 From Documentation/watchdog/watchdog-kernel-api.rst:

* set_timeout: this routine checks and changes the timeout of the watchdog
   timer device. It returns 0 on success, -EINVAL for "parameter out of range"
   and -EIO for "could not write value to the watchdog". On success this
   routine should set the timeout value of the watchdog_device to the
   achieved timeout value (which may be different from the requested one
   because the watchdog does not necessarily have a 1 second resolution).

   Drivers implementing max_hw_heartbeat_ms set the hardware watchdog heartbeat
   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   to the minimum of timeout and max_hw_heartbeat_ms. Those drivers set the
   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   timeout value of the watchdog_device either to the requested timeout value
   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   (if it is larger than max_hw_heartbeat_ms), or to the achieved timeout value.
   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If any of this is difficult to understand, please feel free to suggest
a better wording.

Thanks,
Guenter


