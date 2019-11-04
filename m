Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B69D4EE1DA
	for <lists+linux-watchdog@lfdr.de>; Mon,  4 Nov 2019 15:06:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728595AbfKDOGx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 4 Nov 2019 09:06:53 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44836 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727891AbfKDOGx (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 4 Nov 2019 09:06:53 -0500
Received: by mail-pg1-f193.google.com with SMTP id f19so2264118pgk.11
        for <linux-watchdog@vger.kernel.org>; Mon, 04 Nov 2019 06:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RGW49HjDzn59G0MLzMGyU/ftGwguAnOdp0WLFmM854Q=;
        b=G9S0PCZ/ZKCZmSmrnUyHm0X3w3sq+RPMFwtL/1YZ6guAsO0p/+Zyrz67Obn5DAyBIB
         qNRic8MDGcN+F0TV+kfeWFMD3TtEAX4bW7jvpvM/R1kPhj2urG+v6GHgAlqRr1PPYncC
         vZB+UP6xO8FGg0S3KN2HOdwABHxbZgarFcVQTBj8gLSJonGf5WwR9m3jzgd4vAp4wqBZ
         f4I6YJ4CkYlWw+TEWLsDQ3rEik3cNiYeN1s3f+493036XKr6OS9X+M8nYcDxXKf2TwQ4
         FmZyNlOqzjCKueMRf5WhejX5DBY4NlQdkcv3Nqp6ELKgjH0YZe+i8r/qZRph8KBZBiMI
         0FNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RGW49HjDzn59G0MLzMGyU/ftGwguAnOdp0WLFmM854Q=;
        b=UAtriA4P44uvK9vfSA9ZODu+Hgra5b6Vyr1dC1Fsk/IVV+Sas/TGah5/2VDUE2x5Yg
         5Q1fUlxBBekfmxgSrjb57g0+r/es7OIq9uWcFdY4jZnCd9U2tzTeLGQ2+fus4WvYFOW8
         4oqmlHpfCib3G6sQ+J1QJIJVZ2uVw9m8ahXXM//a22sN+DLG2x+HX5fSQ9PFewqJERdz
         iOsJ2J45nboEm/pnAjACatwq93KhoNUsLWmSVL24mcX2ZrfDZe+YRAvtTTgrCa64I0CR
         1zetxesG8RsyFbFupv79cENJ2tF+iLOirbvQ/XHFgly29b4W74bOVF4vBApjXQ6K97SP
         qGDA==
X-Gm-Message-State: APjAAAWzeQXOD0g3pq95ImDdDJprZCi7waJevpNUIlloOTJBZ+4DlRJf
        flmvwtSx79orVJxzT+s83v0=
X-Google-Smtp-Source: APXvYqzMb79B1tUvwAzfY0qgTnTLtKEW9B5il5J73aMTs+Cq1uWQApytFdo2YaQMuo0CBpypnqbASA==
X-Received: by 2002:a62:2a14:: with SMTP id q20mr28115963pfq.148.1572876412707;
        Mon, 04 Nov 2019 06:06:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z18sm19033717pfq.182.2019.11.04.06.06.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 06:06:47 -0800 (PST)
Subject: Re: [PATCH 1/5] watchdog: imx7ulp: Fix reboot hang
To:     Fabio Estevam <festevam@gmail.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        Yongcai Huang <Anson.Huang@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>
References: <20191029174037.25381-1-festevam@gmail.com>
 <20191102153631.GA5514@roeck-us.net>
 <CAOMZO5AvCHo6pOfX32Bz-r8AjmbuqFWc5YUho9S1Gz8Tdo2SBA@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <69c3f4b9-6ca5-f44d-0ebc-d6fac368ec45@roeck-us.net>
Date:   Mon, 4 Nov 2019 06:06:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5AvCHo6pOfX32Bz-r8AjmbuqFWc5YUho9S1Gz8Tdo2SBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/4/19 5:45 AM, Fabio Estevam wrote:
> Hi Guenter,
> 
> On Sat, Nov 2, 2019 at 12:36 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Tue, Oct 29, 2019 at 02:40:33PM -0300, Fabio Estevam wrote:
>>> The following hang is observed when a 'reboot' command is issued:
>>>
>>> # reboot
>>> # Stopping network: OK
>>> Stopping klogd: OK
>>> Stopping syslogd: OK
>>> umount: devtmpfs busy - remounted read-only
>>> [    8.612079] EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)
>>> The system is going down NOW!
>>> Sent SIGTERM to all processes
>>> Sent SIGKILL to all processes
>>> Requesting system reboot
>>> [   10.694753] reboot: Restarting system
>>> [   11.699008] Reboot failed -- System halted
>>>
>>> Fix this problem by adding a .restart ops member.
>>>
>>> Fixes: 41b630f41bf7 ("watchdog: Add i.MX7ULP watchdog support")
>>> Signed-off-by: Fabio Estevam <festevam@gmail.com>
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>> However, just to be sure: This registers the watchdog based restart handler
>> as restart handler of last resort. I assume this on purpose, I just want
>> to make sure it is intentional since it is not explicitly mentioned in
>> the commit message.
> 
> To be honest, I thought that registering the restart handler was mandatory.
> 
Maybe I should have said "there is no call to watchdog_set_restart_priority()".

> By the way, I have just noticed that even though this patch fixes the
> reboot on a imx7ulp evk board, it does not work on a imx7ulp com
> board.
> 
> I will debug this, so please discard this patch for now. The other
> ones of this series should be fine to apply.
> 

Thanks for the update.

Guenter
