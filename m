Return-Path: <linux-watchdog+bounces-2658-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 699E8A02D4F
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Jan 2025 17:05:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EDDC1665C4
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Jan 2025 16:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC6113BC39;
	Mon,  6 Jan 2025 16:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nM5/qGqu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E6A6088F
	for <linux-watchdog@vger.kernel.org>; Mon,  6 Jan 2025 16:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736179471; cv=none; b=o8eAs1I3UmUpMs952nwNbMNBn3JgHS7RG7OCExSHrBk35UDdZWyEORR/HhmmMj4O22wlQnf+I1jFHAIO6Q3LzZDa2TJweXCjX/4eDcEMqii9Doj2gqWZ1NhLJt3tcGvLrCrbyUFxIANjt0NX/9HrdIHXyhbQw0bsyBlqZXgrDGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736179471; c=relaxed/simple;
	bh=CzaJTjlJGO42ToOp+f+/FOm9rF2HBLaeKcNbFSIf8z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mJhcReByPPm6mkVAWL/Ad6iY4UmUklkrP1qwD8PHWZqxI+Vl5WNItjM/0On8Q+NcOA7ypWHu70GmAZKwc0RpTu3HERyQ0PA8EgwzkzALxcZq5nhXLgmFIstHQHVhix9XUSZaU7AGMxnqJw9jjjn8XkwU8EvpG4k/pnu0hsjfynE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nM5/qGqu; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21669fd5c7cso213176855ad.3
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Jan 2025 08:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736179468; x=1736784268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=TAxVsx0DRPegRc75snI6eV7a+t8lukLtboBwuYvGvXQ=;
        b=nM5/qGqu26IZET53L7cS/EuqvBqK7FT9NgPopvy7sR8ABf8AyuJNEfqsEujEqc5hjl
         P/tzTsilSBkLDeBt4VRab80EUrlQLz+wUMuy8cxNWaAcvsaAinPOFeudFXXgNZiYW7Ul
         2uIOk68kjePt12o1FsiIAZPssnssWxafXUiWrjWfsfcTt7lmQ2nCSHpT6e7OAFvZevN5
         CHAyDYd9E13htwYEIsdOQjH17IZLuwuCvoMN5l9W0ZIldbsF1DcvBosiEtTrvjlyjFxJ
         +38iEoM1TxAifSfGABsmE1KCUJxllHZis0kVmlT5odQyAxgiT7VJPcYYz7R5R/q6p/94
         +XUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736179468; x=1736784268;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAxVsx0DRPegRc75snI6eV7a+t8lukLtboBwuYvGvXQ=;
        b=JFoZHuzDJ4YWFEDRW7p51HK3314tdaaqZQ1pJBKnUoqm7Em4TDrIInQvFmETU6IzCN
         DdGNcGfM96N/SdTw9C2axq01bbmk5192VTzq4BCyUM9KGMm9SlMfKk12N7i+YlFpxx+5
         L0HpIa0L43kMX/L7S9jlx9/KWNfGurrL9VIf2qBvH/TKSQiMZX1nJofbf9lfK6vZFpoA
         BxqUd/VBUaQEP3+irHgYbBTzJf4FCmKolukKaoi6KFwGq5PxAPw/xM/7vwCifhkNN/rm
         +ieac3VCjMOWn2JtaPuAAyXDswYWdHvSYXgN/PJwoh1pp9BbN4rrg+MXdXcj9HSZpPNN
         2AaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIqqRTQ17cJ3W3o1Q2S3tFtmn0/jmR8b6wiAaMr/81VDeK72nP/+aoNstck/jJ6quzCkGM5JmRi6KanVQIQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfvs6ZFuanmRvv8wiWwrw73B3FGgQTuzyO+V3feAQ+V5om4TeX
	d2ksOx8DPTGLNUDfaGBW4mw9tTkU/cPJjSD6zt1OssY69OVfmDWfibV5mQ==
X-Gm-Gg: ASbGnctde9zBkX31mYBRsbr4t0dzPjV3jaJDKqFL5Jwukln4GTFYYRJNbuWvZupdwNW
	cz3n38MXJXMg+cujdnuMARWsNbyexuVLxKcOjtS46HxmOtQCAHqqoPQ344Jq0IwJyamLXNvUUNU
	25RElBnOC+OKT6MbMRoNPquu6SPoO3XPXoD68GZOPMSnqVK5lHQTbE+kNdFP+SfhxDmjBndxPPw
	qG5LoOV+2lxt8E9O7eHEMvlJrMs42h5Yn/O9A0uu5FSsZnSm/WjIoKKKIUbldAHTpA+q3IpObEN
	lTFeB/NBQvzTwLbBplxSK+TYokVSQw==
X-Google-Smtp-Source: AGHT+IExllFbAuhIwJkjl4dBK/LrAc0bkqcd5+J7b5Rzp4QhSY1kno/nsuB5HNFTfs1snYNW7/bhkg==
X-Received: by 2002:a17:90a:d64d:b0:2ea:2a8d:dd2a with SMTP id 98e67ed59e1d1-2f452ee5d39mr82753408a91.27.1736179468493;
        Mon, 06 Jan 2025 08:04:28 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed62cddbsm39975578a91.15.2025.01.06.08.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 08:04:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f05c44ca-e602-4ae4-8ed2-a54b14cbb3c2@roeck-us.net>
Date: Mon, 6 Jan 2025 08:04:26 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: it87_wdt: add support for IT8733
To: "james@foreveryoung.id.au" <james@foreveryoung.id.au>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
References: <SEYPR04MB682104A5CC12856953A3A11CF3022@SEYPR04MB6821.apcprd04.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <SEYPR04MB682104A5CC12856953A3A11CF3022@SEYPR04MB6821.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/23/24 04:06, james@foreveryoung.id.au wrote:
> Add support for the IT8733 Super I/O watchdog timer.
> 
> Tested on a Lenovo ThinkCenter M93p SFF.
> 
> Signed-off-by: James Young <james@foreveryoung.id.au>

 From Documentation/process/submitting-patches.rst:

"No MIME, no links, no compression, no attachments.  Just plain text"

That even has its own chapter, explaining the reasons.

Guenter


