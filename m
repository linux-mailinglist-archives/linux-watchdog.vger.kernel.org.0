Return-Path: <linux-watchdog+bounces-1421-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E0C93A392
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Jul 2024 17:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F1B328457C
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Jul 2024 15:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD8C155753;
	Tue, 23 Jul 2024 15:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eLapEhgL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA31D15445E;
	Tue, 23 Jul 2024 15:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721747690; cv=none; b=e5dg3csDuU22VEs3leJd7VVgaB0SYp97OKTB0ypLww6SW3LM9PbKDLn/X8jDjPf59z+sESD7y3dqsLRmu8YtvCMafOiLI1B3sqVqbT5srouWsacXSrRi1CmEPH7njEHyxybjFWOZE62xRW/FoOBJ5ua643LvOnQfY5+v/qo6n5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721747690; c=relaxed/simple;
	bh=Cq67rOMLvvxvMkMeTU2TSWpFfXHa040dLmsPdMkfreo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SitaSSN/uQyFZ7p3AxHZ/e/3RlVjFRTg8H9kPPJVSBZ89MFax+UpYNeJCnvi36ZuFB2ZxZ7+FjljpCbNAF9pn5yFwbg952acO6SBkf5wBqwUjb5tICtmLc7VvtIYFn2ESpdjrD8i/gRrjW37G0N6j+hJefr6SRgs3XkYu9DYbuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eLapEhgL; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=VTgL5ge11jBWnXDpOUwdP8RTW1RcdJWmSf5FeYaWObU=; b=eLapEhgLQwOvy/aRkTlLU3y5KO
	G6h5VIcP+h/85L2oglrmVT45vXtTIhS6PId3E52cLWcfyGRcQNNo1l44YhFn1P44TKHfZumSdp2BH
	zPpaLsqNA7E6Fv3kubjqiSgcjlLL3OXmlt575Uy7QL6Ut5cVyBQdjCJON+wXixV2cTcHX4j2p2ncm
	BYi5+NGrY1kaPKitajqxzebVrIbJzahyXjCvbqUXhIiGXBvMyUySyewz03YMgnjopUlc5KH5DiEp3
	hVtgZH0dvaQkU8onQ51IE3hcrqMj7tHE6hKXCvu9ElQsAOE24FbKbBFq8UBfFFYChklZPqmn6IcXk
	iHZK5JOw==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWHDx-0000000CqyF-2IxX;
	Tue, 23 Jul 2024 15:14:45 +0000
Message-ID: <63e6c29d-3335-46f4-b296-4c7856abcb35@infradead.org>
Date: Tue, 23 Jul 2024 08:14:43 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Capitalize Farenheit
To: Guenter Roeck <linux@roeck-us.net>,
 David Hunter <david.hunter.linux@gmail.com>, wim@linux-watchdog.org,
 corbet@lwn.net, linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com
References: <20240723131849.264939-1-david.hunter.linux@gmail.com>
 <2de779a1-be76-4aab-8440-9b01a2cc22ce@roeck-us.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <2de779a1-be76-4aab-8440-9b01a2cc22ce@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/23/24 6:57 AM, Guenter Roeck wrote:
> On 7/23/24 06:18, David Hunter wrote:
>> Not capitalizing "fahrenheit" is an extremely minor spelling mistake.
>> This commit fixes that.
>>
> 
> Please at least follow guidelines for submitting patches, specifically
> 
> "Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
>  instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
>  to do frotz", as if you are giving orders to the codebase to change
>  its behaviour.
> "
> 
> Guenter
> 

Also, please spell it correctly in the $Subject.

>> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
>> ---
>>   Documentation/watchdog/watchdog-api.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/watchdog/watchdog-api.rst b/Documentation/watchdog/watchdog-api.rst
>> index 800dcd7586f2..78e228c272cf 100644
>> --- a/Documentation/watchdog/watchdog-api.rst
>> +++ b/Documentation/watchdog/watchdog-api.rst
>> @@ -249,7 +249,7 @@ Note that not all devices support these two calls, and some only
>>   support the GETBOOTSTATUS call.
>>     Some drivers can measure the temperature using the GETTEMP ioctl.  The
>> -returned value is the temperature in degrees fahrenheit::
>> +returned value is the temperature in degrees Fahrenheit::
>>         int temperature;
>>       ioctl(fd, WDIOC_GETTEMP, &temperature);
> 
> 

-- 
~Randy

