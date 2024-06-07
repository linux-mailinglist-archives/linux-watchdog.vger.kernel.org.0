Return-Path: <linux-watchdog+bounces-1109-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F40FC8FFE58
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2024 10:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E505C1C20429
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Jun 2024 08:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD7D15B122;
	Fri,  7 Jun 2024 08:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZhwYgiFM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E207317C;
	Fri,  7 Jun 2024 08:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717750153; cv=none; b=MYnbB4HFVfVl5z/9iXLGXsgvJpgVPlmLm0xOCiKv08rqgtRAKB8hqn7sEsH4ivVAT9hwAHE4tdG0tRe2AIexTWO3Kc0TCPAW/JWIXsDAZ9uKhAobX8rH2qwVjojtBxDcjggyke35RUivDbn8cLzOUlaRJV0yP9Raa4yot7dwq6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717750153; c=relaxed/simple;
	bh=hMoCi3CiZZrj2+Y22zfqnFud4swZKvdCbQXLn4suIv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MDSmB2ZXnnddkdcUxVxVglZPlZbjaPWxRHjt9ahJY2tix3t3aaeCtVNO0tI3t4iEoLBkijPCRL39nexsh5UrGGR9OwZGdmKXjj52U2NayXRTyq4pH6mbxq+yZ+5nqeSqEiSOv6PI7EvjlWZ3ZH1q11CgGjoFXUDTjD5+OUS5jC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZhwYgiFM; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52bc121fb1eso207057e87.1;
        Fri, 07 Jun 2024 01:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717750150; x=1718354950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gOiWxwHu+OpD7Jbm2v+TszlDGCIU7+PiFMWDJObj5oI=;
        b=ZhwYgiFMIgT6X8TKkcSb/W5Iw7VT4Hu6olzeKa6edNjLRRAw2feklC43h6Nm85IGd3
         sKfDUtCx8rdiEK3pt6oxZZDSFjWW5yQNedDJEpewpXGoOrDUJKWvH5iB0T6kpN4pG7MI
         CJHGewzTkVXlYWLVXzOxbkcgJRopE5wtIpsxXZSHQPBQ0bWcGNchNE79v7sUpRjm286f
         pSKL6xCLGgLgW74yoKGOA7HdvrT8ajoLJTy0q5QVTLOReqBrqQPdL96CmF/YHHM33kaG
         yJM9MUfmoo3vVjZApcfYxki9IDzjHYr4WGkKUTDp8b+RVNL8wRWpM0jZE2ad/Ju61FyM
         gm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717750150; x=1718354950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gOiWxwHu+OpD7Jbm2v+TszlDGCIU7+PiFMWDJObj5oI=;
        b=hFwnogc7wqWCZMGQTEYhugJgCG6wFcmjNt7pbF3RNkt3Jcz05voSXcPP8gskWlANSe
         zRFosr1zoYb21MoA4ew3HUYS0w4/LQ9UWLFyeTe+HL8W9jDeIh62T1s6XiNFTLN3qrgM
         PXQCX0HqoHmBf6zcEraktkurKv8ZQV4dowe8qlpqCv+/u8K7nFUKvzenIi6NZ5nYzUu/
         G+kUeecPYnUJ6sTQcd3vzovYP5rBibx2HV536E2Y6AKP2UdS2zJiXZVUG7km16yNnJoV
         u4DNJyBMHzqUutv8UB/JuEt1UwO/S3q8f2AAHAyHEvDO/lfmpUHiHLWsOiNqWhYae+Vz
         6nuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ05yIwyT+FCWnPg1jQlZjU8DWVhi84ZBKNujsWxZnvsZckI5TFiu6DMKHz6GGvT+N+wvCjLvcODfSNkaZcjKw5OE807OJbJukeXrg0bngS0DLsG8Z+/tpQP3rm5dEXJZNbDTQ60D9oHcZNEwSfRMlHUSlHhsl6III1HPxr6nt7gpRU5JYtTLK
X-Gm-Message-State: AOJu0YwhbmMrtitxDRLo/2/fw/5hVDoaBqkCHLtGMM8K4E5AAKU8atNe
	+xge/VqN47xsfAwamB/dWxqr6bMbSUc8LgXOq4zBc1BkBBlUlXu3
X-Google-Smtp-Source: AGHT+IH5NzryrJZakVKjwXwY9sWRTl1oxs9lBNSNMkbs9SI6Ib9HPZ7/ynCWYdwr+ryNzSIxPwSNvA==
X-Received: by 2002:a05:6512:239a:b0:52b:ad6e:87ac with SMTP id 2adb3069b0e04-52bb9f8efd4mr1411884e87.41.1717750149409;
        Fri, 07 Jun 2024 01:49:09 -0700 (PDT)
Received: from [172.16.183.82] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb4216514sm453470e87.163.2024.06.07.01.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 01:49:08 -0700 (PDT)
Message-ID: <b2b31803-44ff-462b-bc1a-6b1ffa93bdf0@gmail.com>
Date: Fri, 7 Jun 2024 11:49:07 +0300
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] irqdomain: Allow giving name suffix for domain
To: Herve Codina <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <cover.1717486682.git.mazziesaccount@gmail.com>
 <bbd219c95f4fe88752aee5f21232480fe9b949fb.1717486682.git.mazziesaccount@gmail.com>
 <87plst28yk.ffs@tglx> <045828bd-4aeb-4d8d-b152-44a816a07221@gmail.com>
 <20240607101356.3ede2a17@bootlin.com>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240607101356.3ede2a17@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/7/24 11:13, Herve Codina wrote:
> Hi Matti,
> 
> On Fri, 7 Jun 2024 09:38:31 +0300
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
> ...
> 
>> Herve, do you have any idea when you plan to do further sketching on
>> this? Do you want me to try seeing if I can add the struct
>> irq_domain_info and maybe use that in the __irq_domain_add() to get the
>> name-suffix added? I might be able to send one version out during next
>> week - but then I plan to be offline for couple of weeks ... so it may
>> be I am not much of a help here.
>>
> 
> On my side, I plan to work on it next week too.
> If you are off a couple of weeks after, I think I can start and move forward
> on this topic.

Thanks for the prompt reply and thanks for working with this :) I'll 
leave it to you for now then, as I don't think it makes much sense to 
intentionally do conflicting changes. I'll see what you've been up to 
when I return to the keyboard :) I'd appreciated if you added me to CC 
when sending the irqdomain refactoring patches (but I can dig them up if 
you don't).

Have fun!

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~


