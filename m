Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE3670817
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2019 20:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731165AbfGVSDM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Jul 2019 14:03:12 -0400
Received: from mail-pg1-f182.google.com ([209.85.215.182]:40675 "EHLO
        mail-pg1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731166AbfGVSDM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Jul 2019 14:03:12 -0400
Received: by mail-pg1-f182.google.com with SMTP id w10so18033726pgj.7
        for <linux-watchdog@vger.kernel.org>; Mon, 22 Jul 2019 11:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=PVffGMMGnocUkXYRj+0nnNJp11p35TzrPAOQQddq1Fk=;
        b=duCOA2sszfWUJVItCWAIARD75BL8bnvOTomVWOeNDb8sauSYJU96Rulfxa+nrXI1HS
         7jlwt41HG9ZWM3CZwYR6DTKHrLJge0pRT0UHLX4zGVbvV6yg9smwXrH4jUFqGyIY48O7
         68YTN8Uw6q/+7lNjcLyJZ9E7EEy/hWGXcn3hkBpxSGF2MUSXJn+sFRapYwIZPfXlCffZ
         ilAlGeWeenk4PyoiQyiaQ2X5Ai8enmOBsaoZGXZPJOkpLwGymnbGb53phTWbcykdESJm
         Eb6Hg5L5o/KNXGQgSrMVrrZ0iWvlnInz1brjFXw+Z6tQHexS9IekqN/Jjtce5/whpPHZ
         yBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=PVffGMMGnocUkXYRj+0nnNJp11p35TzrPAOQQddq1Fk=;
        b=XFy4R5teatvHlRv4zDd+3NKak+z92vx71b0efYiWo7jX0tTC+g0lkdT22+gTrhkiy9
         mlWvgtk/89/UF1x/HT9F88noyUPqtkSUuQFz4DPLkrQw22iM17DIZ9tUldUY3mrBNs3X
         kUr6wesS1xScI/umhI96irs6+vbN5JMaTJa1u8/HrOjCWWt7GGW6VOL+6MmdekdER9KW
         NvrZnEW3RkW5OQmVv/T0rewhHKpU/M8P07HbVBQP6Wv3tagbUh9n8bWT4Nkc3btgUhGs
         TpFs92b1TpEQi4/IeHstr7I3YrpmugotKjaKGAVrsfVT+cOhfs7cmpI5KIjW1QruRqTs
         1jYw==
X-Gm-Message-State: APjAAAX4VmAZI8HY4j03AD+jxz8USVL6gbW8XILyNBRXnWgbMAWyrys5
        CFhVlC7QsrfygJODogY5sDNHM8ib
X-Google-Smtp-Source: APXvYqx2fiGjf07VUkn76Cp/9IjKVnKTpPWNLuG4NXCtHkU2XwS08jRoiRd3o2jAo8Qz0lEU9euErA==
X-Received: by 2002:a65:5a44:: with SMTP id z4mr72793570pgs.41.1563818591882;
        Mon, 22 Jul 2019 11:03:11 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k6sm48462406pfi.12.2019.07.22.11.03.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 11:03:11 -0700 (PDT)
Date:   Mon, 22 Jul 2019 11:03:10 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Valentin =?utf-8?B?VmlkacSH?= <vvidic@valentin-vidic.from.hr>
Cc:     linux-watchdog@vger.kernel.org
Subject: Re: iTCO_wdt on Intel NUC
Message-ID: <20190722180310.GA13365@roeck-us.net>
References: <20190721203047.3jd6slko6guz52fl@valentin-vidic.from.hr>
 <d2f78a10-df19-9922-565d-b0ed6fcacb67@roeck-us.net>
 <20190722045557.tndjp4hnpngvlaql@valentin-vidic.from.hr>
 <20190722154549.GA5166@roeck-us.net>
 <20190722161026.3bzxwibivomuysqf@valentin-vidic.from.hr>
 <20190722162152.GB8122@roeck-us.net>
 <20190722174129.qzlg5exwx5ns3fkw@valentin-vidic.from.hr>
 <20190722175203.GA12554@roeck-us.net>
 <20190722175658.vipkznf2pnegwtyk@valentin-vidic.from.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190722175658.vipkznf2pnegwtyk@valentin-vidic.from.hr>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 22, 2019 at 07:56:58PM +0200, Valentin Vidić wrote:
> On Mon, Jul 22, 2019 at 10:52:03AM -0700, Guenter Roeck wrote:
> > Is this the first mention of iTCO_wdt in the log ?
> > The easiest explanation that this point would be that lpc_ich instantiates
> > iTCO_wdt as well.
> 
> I have removed lpc_ich and the other relevant modules and than try to
> load i2c_i801. It seems to me that perhaps i2c_i801 passes the wrong
> parameters to iTCO_wdt or something like that?
> 

No idea, sorry. I don't have the system, and I have no means to debug it.
The authors of the code in i2c_i801 might be able to help.

Guenter
