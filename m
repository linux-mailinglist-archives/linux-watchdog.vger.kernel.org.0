Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E6444F2B6
	for <lists+linux-watchdog@lfdr.de>; Sat, 13 Nov 2021 12:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233765AbhKMLWu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 13 Nov 2021 06:22:50 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:36585 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231735AbhKMLWt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 13 Nov 2021 06:22:49 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 1C2D7580AD8;
        Sat, 13 Nov 2021 06:19:57 -0500 (EST)
Received: from imap47 ([10.202.2.97])
  by compute3.internal (MEProxy); Sat, 13 Nov 2021 06:19:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm2; bh=cGhqfy13haD7LzgLYmXe59yMHYPr
        xi1YR0jX4iy4R5I=; b=cDwBkIuUEm5HCYb0VkTZXHCrGjdG4XHz6ARTtu9y6RDn
        odKxTSrlX+uxjMdWKvFY7iNJ62j1A594J7RGfmDCeIdNIvPrsGv5v7vbIF2Py2Ob
        3DUSI0BLwmSQMS6q3MZ7hfOqJWMNlTsnwubtiKsW6+YTXefQkoarYQoyC631jB5m
        vNdPLYtgHPmoc/k9wda/mmd1K6feEgfVCS76kgGkJGc8qMqaVWjzOmdPdK6EhHw1
        urJqlvOLDLS9aQPORkFkd6rEEBUTJorOuDHiqOB9LT5AJSitDpc512/Ret5aq+dx
        1W0rBZ3C0ehHnlb/UFaK/cOy50yeGNGdY2Fgai3zrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=cGhqfy
        13haD7LzgLYmXe59yMHYPrxi1YR0jX4iy4R5I=; b=YPlWDAc2KT1EKlvZpiKh/E
        IvyZOoLWLOaO0XJ1TcwbHtTO1MOU+Npx3uZOnRw/WTIUjw9P48WeSweyAxolAw7r
        5u44DZ/plcV+3mpZGlU6WktmSSL3ltE6ZAShlTkbHoD5g5AJgDjvvmwq9fyC8bFA
        BmVhXmFmH4RV4lnNKIG9rcOsSfUAIqLGhM15cxVO/OpIGPQ6BgVd8q11Gv1TBSuR
        kk3UJXvzXI/VaFVsIsLpC1nsS6TVdMsQ4gOXjFYrYAt3uXfPjp7RrPu13WltgqGU
        YIINZe0rOTHWJiSv78pIuBkglMaFJzYnJE8sueeDRhLPi3ABrh84BqXMj+mCxJIQ
        ==
X-ME-Sender: <xms:XJ-PYTVIC-bnLLwWQzdADdmcMeGnWwMkWmFrHdKwTraLc4uIS7P5-A>
    <xme:XJ-PYbl4f-RRDIpIAbdFOfaJValX5vptSazhZbO2jKWJpgMSXMHGjO2GZE6SvxoIi
    OSYVBQdA1uLgOVidns>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrvdehgddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfufhvvghn
    ucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrth
    htvghrnhepgfeigeeiffeuhfettdejgfetjeetfeelfefgfefgvddvtdfghfffudehvdef
    keffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsh
    hvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:XJ-PYfb0qICOBlSdNRDPvQcJmfIQiaduCPzrc6xS1KnWVBw8uLRpkw>
    <xmx:XJ-PYeW8sP_rBYGDNDGT9-z7Ev8upH-aiIiO7ldEYQpDxZoEeA0niw>
    <xmx:XJ-PYdnvVZ3ShlIH_pU0cN5izE-PdCgAkgFxpRlv2m-clyPevhL0BA>
    <xmx:XZ-PYf4G93PsR1J8lvUvxWdB8t43qQsFbr9fgqhfi2pmM-CGtTtoxA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 65F5F27400FB; Sat, 13 Nov 2021 06:19:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1371-g2296cc3491-fm-20211109.003-g2296cc34
Mime-Version: 1.0
Message-Id: <0fc06d43-fcca-4cc5-a0e2-9a066bfb7702@www.fastmail.com>
In-Reply-To: <20211113111410.GB10073@jannau.net>
References: <20211113094732.73889-1-sven@svenpeter.dev>
 <20211113094732.73889-2-sven@svenpeter.dev>
 <20211113111410.GB10073@jannau.net>
Date:   Sat, 13 Nov 2021 12:19:35 +0100
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Janne Grunau" <j@jannau.net>
Cc:     "Wim Van Sebroeck" <wim@linux-watchdog.org>,
        "Guenter Roeck" <linux@roeck-us.net>,
        "Hector Martin" <marcan@marcan.st>,
        "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Mark Kettenis" <mark.kettenis@xs4all.nl>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] watchdog: Add Apple SoC watchdog driver
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Janne,

On Sat, Nov 13, 2021, at 12:14, Janne Grunau wrote:
> On 2021-11-13 10:47:32 +0100, Sven Peter wrote:
>> Add support for the watchdog timer found in Apple SoCs. This driver is
>> also required to reboot these machines.
>
> Tested on a M1 Max with
> compatibe = "apple,t6000-wdt", "apple,wdt";
> MacOS 12 on the same machine does not use the watchdog for reset. MacOS 
> log output suggests that it uses a "pgmr" call for reset.
>
> Feel free to add
> Tested-by: Janne Grunau <j@jannau.net>

Awesome, thanks for testing this!
I suspect that they added an additional reset path for the Pro/Max variants.
On my M1 macOS seems to only use this watchdog to reset the machine.

And if I understand the linux reset infrastructure correctly it's still fine
to have this as a "fallback" reset notifier even on the Pro/Max and add support
for the proper "pmgr" reset notifier eventually with a higher priority. 


Best,

Sven
