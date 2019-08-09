Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21D5488127
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2019 19:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbfHIR3J (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 9 Aug 2019 13:29:09 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46364 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbfHIR3J (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 9 Aug 2019 13:29:09 -0400
Received: by mail-pg1-f193.google.com with SMTP id w3so8977198pgt.13;
        Fri, 09 Aug 2019 10:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=2l2uOku7IZIdjpnDK2uRPlXP2kUl+VlcuE2o6tTh0qM=;
        b=VOhJowUjF7HpnqkbCxFXoMMEq+gVRzXhe2DBlCi5etX6yBcO+JO9bVYCXJ/BLxX2hH
         b3zbUhe+0LS72aW1bQNp/HRElRZdWKfB2/UDhSrBegbUf7F3Vv/dB40zVLC/cIKEuCnE
         B3zZwPUe+jwI13wD9XaNQtuAyf5kdJFLc4AG6jVf9cIIuRZPHJX1j68EPknjWq7sJylT
         5aLe3V6gf6IKWhRWsUPV/ETZ5SEPhJP3qukNKXp2whMHT92dzlpPkJbhXKqePZ/OD8rU
         gmZVdIbvb9iDRmVMUraebYkz2F9EhJv8Ye9yffKS0JzBNE9qLSXdAP4XI1Fj/mZ6addv
         c6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=2l2uOku7IZIdjpnDK2uRPlXP2kUl+VlcuE2o6tTh0qM=;
        b=R6SFi+r4UmLY+9gBtCDl15t1DVO39tcqSsVRGnOFRlzF/JGiKvlqIAj8ps5u0INMGL
         ihVKNiNkyPyhqERu5QoP50hzrp+shqaF9sl/TG3WmtJlmxw30nVBhue8KXgwwWqWpdJK
         6b+R5M761wXUAjlrqhPMNFkPXmiFZF4OFPq4pYBDSktqBgDHKdydss5ywHF98FCdoB0/
         0TbWDUgWhY3a3Zh6qvoql4dyp7A6U/lxasXtflRx2LvDVQdwN7rJIPRwIPgZfx5Lso95
         Zb/uRJe6YdxW/P2DLQ8I9ZsJ8H3jHDskRzuUM+lkvxqgG5Wi+i6tVhYYTLkhwlSMepAB
         53tg==
X-Gm-Message-State: APjAAAXDJTXUlKg8R9NnPBmuGlxESayGbfU8g1WkFMmSntqufmmzRhIQ
        +joY4ZqyJ9K7PhwbMJOW8Xo=
X-Google-Smtp-Source: APXvYqypywdRwkvnpkLb0alAWpcF3w1UWCqaPzX3ClRIQhWQ+QJv1naaOve6ISzMPMzRpujrUVKiJw==
X-Received: by 2002:a17:90a:9301:: with SMTP id p1mr10439917pjo.22.1565371748343;
        Fri, 09 Aug 2019 10:29:08 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g1sm161190879pgg.27.2019.08.09.10.29.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2019 10:29:07 -0700 (PDT)
Date:   Fri, 9 Aug 2019 10:29:06 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>, od@zcrc.me,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] watchdog: jz4740: Driver update
Message-ID: <20190809172906.GA21450@roeck-us.net>
References: <20190809115930.6050-1-paul@crapouillou.net>
 <20190809165207.GA18104@roeck-us.net>
 <1565369726.2091.0@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1565369726.2091.0@crapouillou.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Aug 09, 2019 at 06:55:26PM +0200, Paul Cercueil wrote:
> Hi Guenter,
> 
> 
> Le ven. 9 août 2019 à 18:52, Guenter Roeck <linux@roeck-us.net> a écrit :
> >On Fri, Aug 09, 2019 at 01:59:27PM +0200, Paul Cercueil wrote:
> >> Hi,
> >>
> >> This patchset comes from a bigger patchset that was cut in smaller
> >> pieces for easier integration to mainline.
> >> (The patchset was https://lkml.org/lkml/2019/3/27/1837)
> >>
> >> The reviews were kept since the code mostly didn't change. The
> >>exception
> >> is the use of device_node_to_regmap() in patch 2/3. This function was
> >> added in a prior patch, now merged in the MIPS tree.
> >>
> >> For that reason this patchset is based on the ingenic-tcu-v5.4 branch
> >>of
> >> the MIPS tree
> >> (git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git).
> >>
> >
> >What is the expectation here ? Should the series be sent upstream
> >through the watchdog tree, or through some other tree ?
> 
> You can get it through the watchdog tree if you merge the ingenic-tcu-v5.4
> branch from the MIPS tree. If you'd rather not do that, I can get it merged
> through the MIPS tree.
> 
I would prefer a merge through the mips tree.

Guenter
