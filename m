Return-Path: <linux-watchdog+bounces-1398-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B86AD93200F
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Jul 2024 07:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B27A21C2196A
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Jul 2024 05:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7367F15E9B;
	Tue, 16 Jul 2024 05:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4WCSV17"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E4915EA6;
	Tue, 16 Jul 2024 05:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721107819; cv=none; b=X/bwMElfTidyQdf2kreviIYe46rl5WDSgzbRbSor7RL82bIa48r4s8cVu2WLZ+a7WAnGk6Oqz5WwdX9Cp0AbK4jp1CiyeM8+jF3tLw+eOF6JTTJtEkOgDr78k/oGAtZbq+Wjf0yGCH87Am1MUbftRQifzVNYEPSZZPr4utSlzlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721107819; c=relaxed/simple;
	bh=+doUghyhtuWkTqmCEPxqUDaHMOU4eE3B8vBE9cMoIVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ni4XXJ+tJAKqYEv1nDnS9Fuz7KpQIDtWv0JxrRoJAw6ll+aYF5wfa5lVa4ddCiCRZ5cUAJzaQVTszbjcior/yFrTjrUDHsVNIKNcpToyq8ECNkcr04ShJDvyys8s9nxVGpt4l80s0XXp/ICeAlP3y9agZhJWMwiDzcEp/zfXKvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4WCSV17; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fb3cf78fcaso34617575ad.1;
        Mon, 15 Jul 2024 22:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721107817; x=1721712617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9GvAbw2+QEdQ/vGjwyQTSMa6PXDq48QTGM5pRuyk3as=;
        b=X4WCSV172HEb7UQgG319cfvZE5/jQ34ivph2cKs15uFzrODwuAW2ruJOkRK19l+ot2
         mFzckH+CHAuSc3HWUqw8EVrn0ClGIiVyyVVhGlXCcD0BBBlIgGNiPEQ8HdN5zWmBsQwt
         SRj8gdxRtjbbREfJXeoBbA3S0XvF1CVXCt0yjppPeOQKpDxy9eRQO7XHlF4/hFSTbZ8H
         /5mfGv8mQN0w87+S1eEFxnfwZWcoZPfiEPXPnN2JxKZh9/DzM/6Pqz/AlST20eScNZ9j
         c4IvSi2dh9QEtUAggMu+RoQtaOiURT8MfjpaNgdr/yBEZqsyXZCGt0e4cCkOVqzg1d13
         E88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721107817; x=1721712617;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GvAbw2+QEdQ/vGjwyQTSMa6PXDq48QTGM5pRuyk3as=;
        b=gQFAOG6KWLFwMNN0u8UFyOtkn5okJeKVUKzJkn92jSnKkwkISPXNA4xTGE9vi+u9Rb
         XEy4N1LNQZz1nypldno9O41XiHwnomuZVhfvGP00gTap+6EjTDieCL9Jd6KEPjuk2Rop
         bVvKScnJKv2sGPWRyKSQIZUhmPb0Yehu3XROilOo6hbdoTHQr0tkdFvwJ//GE+RY1hIg
         qvr6FMXFRHdKbJ3KQ6mOSk9r9PlvnSbaoU3uWwnRWe7Mf6OdHdFe31XIiX8apnYFQQxw
         H2gGab415CLUWS21z2NlhMITTF4AWE0CFnIEaIselzJyIMgKiGKgrx9ybBpdaRlb9lA9
         mfcQ==
X-Forwarded-Encrypted: i=1; AJvYcCX892wiDh0Uw4JFCgFFAdjPjgnZgaCzrqsd3ePmXNiTdYLXuIjdS7le08S8V0EK6GKv0RCuR4CT3jvuHH4Po8xR16ojjCd6n1WzVBxx
X-Gm-Message-State: AOJu0YxfdljuI81sdHzlID/PI1n2Nv5fvzLbhT8wiAU1IBaA5Ht3Ts80
	Vpw3bIObmW9Lo9vN81e++R1IR18pFrm+XJn3b74RYYt+i+pZH0VP
X-Google-Smtp-Source: AGHT+IEPYMo8gYQskcf2kw99pQwQH1OCllXS7FMoIMYGSNM6L6DAQy+pgFEZUM+2aaKZ+iGvgV4H5g==
X-Received: by 2002:a17:902:dacf:b0:1fb:48c3:9328 with SMTP id d9443c01a7336-1fc3da01822mr8143215ad.52.1721107816932;
        Mon, 15 Jul 2024 22:30:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc39078sm49710055ad.228.2024.07.15.22.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 22:30:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <58be303d-d56c-4c56-9756-6b1b0441ccc2@roeck-us.net>
Date: Mon, 15 Jul 2024 22:30:15 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: rzn1: Convert comma to semicolon
To: Chen Ni <nichen@iscas.ac.cn>, wim@linux-watchdog.org,
 jjhiblot@traphandler.com, tzungbi@kernel.org, phil.edworthy@renesas.com
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240716031137.400502-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240716031137.400502-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/24 20:11, Chen Ni wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Fixes: d65112f58464 ("watchdog: Add Renesas RZ/N1 Watchdog driver")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>


