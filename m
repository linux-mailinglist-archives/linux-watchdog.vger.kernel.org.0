Return-Path: <linux-watchdog+bounces-2572-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7230F9F1C22
	for <lists+linux-watchdog@lfdr.de>; Sat, 14 Dec 2024 03:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE77E188C570
	for <lists+linux-watchdog@lfdr.de>; Sat, 14 Dec 2024 02:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F4B17BD6;
	Sat, 14 Dec 2024 02:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToOz0zOx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B35C17BA0;
	Sat, 14 Dec 2024 02:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734144136; cv=none; b=e0otrH1dF+HQ+6wTVxnhEZYLaM29oWtt2azBIC1zu4MUDZm+Z0LiUOVZgizdYfvbpB4ygkonLA9odvrWa30y+yyG9QepYvcXoBMXe+HS0kM/t1yIAqbwtAcBs5SHLaBp4a7AOvCK/W05fg+13O/4+zS0EKQ7McStdSVuZhdOV9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734144136; c=relaxed/simple;
	bh=E/ei8zAjGpX1Vcv6H89jd2mz0uozpfXftAWHeRMDPeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l1Y8/Ap23DT2geuMqP6+rbrAMjj215k4mxD3MVDs5dYcEjimCfhUfXMkGW3RWjZhb2COBGukJ0SVV+8z8e3p5EzfhwEc89/BttHayIwPBnd2tUurdGF8j8Fw5WT39ZQ3yvuUBb1LV91CIVEQ1BDJJv4/YKcno3SheYKS+b/tGLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ToOz0zOx; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7273967f2f0so2519231b3a.1;
        Fri, 13 Dec 2024 18:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734144134; x=1734748934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PBAf6LWuchkb2l4eZW2VS4Gj9M3cycqMeWAzjeCxSvo=;
        b=ToOz0zOxABX55BmWPe+dSa9TnmY4rqVNFykmw3ZSD5gi2Q7s21DhkmlZmaUWqtlBDt
         g8ipB4QCtM1qCsRry3Z9baKcSvknKbh+Ke7u2nWLv+wrdCZqFa+prPgjpahIlFWf3qNE
         8lHvb9RksX9QOtU2MjkKeOyXbdfIQb+4S96pF9y86kXKjkQaRjSN3zvduFU+4meTVTx7
         8CfHWogY2wydvsDtF8fawaDcogEIZfzvfwwtOmy7cLkQ7z9FvHKoEBhchZ7DAdeiA9WX
         MEV08i6qe4V+BL7vAKaB0eZ124L4rPIpTHqkEXLLEwJZ4wCZ/6+wUcqyP+mFfkRe/6Mc
         WB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734144134; x=1734748934;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBAf6LWuchkb2l4eZW2VS4Gj9M3cycqMeWAzjeCxSvo=;
        b=o9jCSrPjINgb0X7xeMHkzJDE2smqo3pTeQAhbh3HsTIRP7eIWC9GTQVl35AjlN+rt9
         onq6Qv/KqkZdk5omT2Z0h435kSMeMGeaA5EJtj5GpOxWO5fQjlsMQFY6e9bgIADbDVe2
         E1K+3DCF3ELwugorZCGWAiX6umYdkaRQSXHx0jpxkeUgOcSIe/utiIrz39XUo/wb6rue
         Y3HeQZMbDCyrHOCyKKuKptF2P0vit09IVBGbSMOnbDSYY3B8Im2gk2By/k6U0yKZvIPg
         QY08aiFPtdZcMxBisCa5LEcVJSjafj4bU9PJSV7JQHuIYiOKaZDermEWq7MnwoC/7AZ2
         mCNw==
X-Forwarded-Encrypted: i=1; AJvYcCU6DIcEBjVn5dVPGoOg1gcTBJRxcw0UA61/1U8M75GZEDA2jhOr6K3E6Zy1KVhqdFNkPcta8dSHSzEVBRUJQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4jKSCnMFJjP6El7oqYZ6HgWNXaz/znTcXmx7rDTJr5TOFc3P4
	qjbEg6akSvtbyn9SJoutlW0bpdmNT8ZONM8MlM1OGQ+fhtG0zaXh
X-Gm-Gg: ASbGncvssXKvYbYt2bkThuyDwsZKGpsJ9KSqtyLDGV5DRF9yan9edx1cwqPUkaOH8SD
	1Bq6U1DTdPT/AJd6WS5rwUFpZWmAsCZuhN8WeS6bCr6uN4UflGR/aAUohqHkJ44AxsnrGfaRroH
	4fgqJQzMyTXwKJd8Vhk+nrDHM0FHlz6YnYrb/ly5KmV41KX/2pzuaGu/7S3UQQAz/QPDRyuxhTo
	F4tLBihuWU4+PhW82vReYW/SOX/tQopbxpdo/Q8Bgrtji26jKOS5cSL5W33F/DJyotHscaSaO0T
	gzDlxin+2cgt2rOZPVIUIRRW9ku5oA==
X-Google-Smtp-Source: AGHT+IFCVm0klUAzuZvPX8NBY1qAynbHdhC9wqWG1suCo8ZalY9vqbtABtqn31vfhi0KP4zY0290fw==
X-Received: by 2002:a05:6a21:3396:b0:1e1:f5a:c027 with SMTP id adf61e73a8af0-1e1dfe5c22dmr6439404637.43.1734144134367;
        Fri, 13 Dec 2024 18:42:14 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918bcde1csm481919b3a.193.2024.12.13.18.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 18:42:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <083eb060-74b3-42da-a9eb-3ff2b8f68896@roeck-us.net>
Date: Fri, 13 Dec 2024 18:42:12 -0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: sp805_wdt: Drop documentation of non-existent
 `status` member
To: Lad Prabhakar <prabhakar.csengg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20241213192858.916377-1-prabhakar.csengg@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241213192858.916377-1-prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 11:28, Lad Prabhakar wrote:
> Remove the documentation for the `status` field in the `sp805_wdt`
> structure, as the field does not exist.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter


